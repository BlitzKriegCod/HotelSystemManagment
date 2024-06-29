import { NgModule, OnInit } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { LoginComponent } from './login/login.component';
import { HomeComponent } from './home/home.component';
import { NavbarComponent } from './navbar/navbar.component';
import { AppComponent } from './app.component';
import { HomeScreenComponent } from './home-screen/home-screen.component';
import { RegisterComponentComponent } from './register-component/register-component.component';
import { ReserveComponent } from './reserve/reserve.component';
import { AuthGuard } from './services/auth.guard.service';
import { AdminScreenComponent } from './admin-screen/admin-screen.component';
import { AdminComponent } from './admin/admin.component';
import { AdminGuard } from './services/AdminGuard.service';
import { EditReservationsComponent } from './edit-reservations/edit-reservations.component';
import { BalanceComponent } from './balance/balance.component';

const routes: Routes = [
{ path: '', redirectTo: 'home', pathMatch: 'full' },

{path:'home',component:HomeScreenComponent  ,

children: [
  { path: '', redirectTo: 'default', pathMatch: 'full' },
  { path: 'default', component: HomeComponent },
  { path: 'login', component: LoginComponent},// Un componente ficticio para demostrar
  { path: 'register', component: RegisterComponentComponent},
  {path:'reserve/:id',component:ReserveComponent,canActivate : [AuthGuard]},
  {path:'reserve',component:ReserveComponent, canActivate : [AuthGuard]}
]},

{path:'admin',component:AdminScreenComponent,

children:[

   { path: '', redirectTo: 'default', pathMatch: 'full' },

   {path: 'default', component:AdminComponent,canActivate:[AdminGuard],

    children:[

      { path: '', redirectTo: 'balance', pathMatch: 'full' },
      {path: 'balance', component:BalanceComponent,canActivate:[AdminGuard]},
      {path: 'reservationsedit', component:EditReservationsComponent,canActivate:[AdminGuard]}


    ]
   },

   { path: 'login', component:LoginComponent},
]}


];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule  {


}
