import Vue from 'vue';
import VueRouter from 'vue-router';
import Index from '@/page/index.vue';
import List from '@/page/list.vue';
import Create from '@/page/create.vue';
import Read from '@/page/read.vue';
import Update from '@/page/update.vue';
import Delete from '@/page/delete.vue';

Vue.use(VueRouter);
export const router = new VueRouter({
  mode: 'history',
  routes: [
    {
      path: '/',
      name: 'index',
      component: Index,
    },
    {
      path: '/list',
      name: 'list',
      component: List,
    },
    {
      path: '/create',
      name: 'create',
      component: Create,
    },
    {
      path: '/read',
      name: 'read',
      component: Read,
    },
    {
      path: '/update',
      name: 'update',
      component: Update,
    },
    {
      path: '/delete',
      name: 'delete',
      component: Delete,
    },
  ],
});
