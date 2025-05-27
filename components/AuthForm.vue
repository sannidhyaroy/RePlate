<template>
    <UCard variant="subtle" class="auth-card">
        <UForm :validate="validate" :state="state" class="auth-form" @submit="onSubmit">
            <div v-if="signupForm" class="form-item name-field">
                <UFormField label="Name" name="name" required>
                    <UInput v-model="state.name" type="text" placeholder="Enter your name" />
                </UFormField>
            </div>
            <div class="form-item email-field">
                <UFormField label="Email" name="email" required>
                    <UInput v-model="state.email" type="email" placeholder="Enter your email ID" />
                </UFormField>
            </div>
            <div class="form-item password-field">
                <UFormField label="Password" name="password" required>
                    <UInput
                        v-model="state.password" type="password" :placeholder="signupForm ? 'Create a new password' : 'Enter your password'" />
                </UFormField>
            </div>
            <UButton
                class="form-button" :label="signupForm ? 'Sign Up' : 'Log In'" :icon="signupForm ? 'mdi:account-plus' : 'mdi:login'" type="submit" :loading="loading" loading-icon="i-lucide-loader" />
        </UForm>
    </UCard>
</template>

<script lang="ts" setup>
import type { FormError, FormSubmitEvent } from '@nuxt/ui';
const supabase = useSupabaseClient();
const router = useRouter();
const toast = useToast();

const props = defineProps({
    signupForm: {
        type: Boolean,
        default: false
    }
});
const loading = ref(false);
const state = reactive({
    name: '',
    email: '',
    password: ''
});

const validate = (state: { name: string | null; email: string; password: string | null; }): FormError[] => {
    const errors: FormError[] = [];
    if (props.signupForm && !state.name) {
        errors.push({ name: 'name', message: 'Name is required' });
    } else if (props.signupForm && state.name!.length < 3) {
        errors.push({ name: 'name', message: 'Name must be at least 3 characters long' });
    } else if (!state.email) {
        errors.push({ name: 'email', message: 'Email is required' });
    } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(state.email)) {
        errors.push({ name: 'email', message: 'Invalid email format' });
    } else if (!state.password) {
        errors.push({ name: 'password', message: 'Password is required' });
    } else if (state.password.length < 8) {
        errors.push({ name: 'password', message: 'Password must be at least 8 characters long' });
    }
    return errors;
}

async function onSubmit(event: FormSubmitEvent<typeof state>) {
    loading.value = true;
    console.log(event.data);
    if (props.signupForm) {
        handleSignUp();
    } else {
        handleLogin();
    }
}

const handleLogin = async () => {
    const { data, error } = await supabase.auth.signInWithPassword({
        email: state.email,
        password: state.password,
    });
    loading.value = false;
    if (error) {
        toast.add({
            title: 'Login Failed!',
            description: error.message,
            color: 'error'
        });
    } else {
        toast.add({
            title: 'Log In Successful!',
            description: 'You\'re Logged In',
            color: 'success'
        });
        router.push('/');
    }
    return data;
}

const handleSignUp = async () => {
    const { data, error } = await supabase.auth.signUp({
        email: state.email,
        password: state.password,
        options: {
            data: {
                display_name: state.name
            }
        }
    });
    loading.value = false;
    if (error) {
        toast.add({
            title: 'Sign Up Failed!',
            description: error.message,
            color: 'error'
        });
    } else {
        toast.add({
            title: 'Sign Up Successful!',
            description: 'Your account has been created. Please check your email for verification.',
            color: 'success'
        });
    }
    return data;
}

</script>

<style scoped>
form {
    display: flex;
    flex-direction: column;
    gap: 1rem;
}
</style>