Return-Path: <virtio-return-3606-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio@lists.oasis-open.org>
List-Post: <mailto:virtio@lists.oasis-open.org>
List-Help: <mailto:virtio-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-subscribe@lists.oasis-open.org>
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <CACGkMEvD1yihytUSarjqD2NjrUv_=YsM82pvG0OnhaqRqq1iWg@mail.gmail.com>
References: <20211011113828.309458-1-cohuck@redhat.com>
 <CACGkMEtb8P76pu0VM+B-Dt1BMi1edxv18BmAN0S6Z6_vHLHKSA@mail.gmail.com>
 <87sfx6wl0i.fsf@redhat.com>
 <a8481ea4-31a8-149d-70df-6ccabdf8bce9@redhat.com>
 <87h7dlwgqm.fsf@redhat.com> <87lf2ms5wo.fsf@redhat.com>
 <20211022013520.1a92ebfe.pasic@linux.ibm.com>
 <CACGkMEvD1yihytUSarjqD2NjrUv_=YsM82pvG0OnhaqRqq1iWg@mail.gmail.com>
Date: Mon, 25 Oct 2021 09:36:56 +0200
Message-ID: <87a6ixsgh3.fsf@redhat.com>
MIME-Version: 1.0
Subject: Re: [virtio] Re: [PATCH] ccw: clarify device reset
Content-Type: text/plain
To: Jason Wang <jasowang@redhat.com>, Halil Pasic <pasic@linux.ibm.com>
Cc: virtio@lists.oasis-open.org, virtio-comment@lists.oasis-open.org
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Oct 25 2021, Jason Wang <jasowang@redhat.com> wrote:

> On Fri, Oct 22, 2021 at 7:35 AM Halil Pasic <pasic@linux.ibm.com> wrote:
>> Another interesting question for the reset is system boundary. I.e. what
>> exactly is reset.  Some publications describe possible electric
>> signaling interfaces, and I doubt this kind of a reset would be a
>> complete reset of the device from that perspective. But that  question is
>> not what this patch is about. It just came to my mind.
>
> Since virtio is built on top of the transport. I think the lower level
> (transport) reset implies a virtio reset.

...ok, maybe I misrepresented your reply in my reply to Halil (should
not write before the first coffee). But I would indeed expect a
low-level reset (e.g. a channel subsystem reset) to imply that the
virtio structures are reset as well.


---------------------------------------------------------------------
To unsubscribe from this mail list, you must leave the OASIS TC that 
generates this mail.  Follow this link to all your TCs in OASIS at:
https://www.oasis-open.org/apps/org/workgroup/portal/my_workgroups.php 

