Return-Path: <mst@redhat.com>
Date: Mon, 3 Jan 2022 12:14:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [virtio-comment] RE: [PATCH] content: reserve virtio device ID
 for QingTian Box devices
Message-ID: <20220103121259-mutt-send-email-mst@kernel.org>
References: <20211209140543.1876-1-longpeng2@huawei.com>
 <d09a2b0c1cee4d2180b33c452a42794c@huawei.com>
 <20211227031128-mutt-send-email-mst@kernel.org>
 <2be7836713cc4d06ba24b86d21d18094@huawei.com>
 <87o84t3vm8.fsf@redhat.com>
 <761e286875084a79837e7a68eb431055@huawei.com>
MIME-Version: 1.0
In-Reply-To: <761e286875084a79837e7a68eb431055@huawei.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>
Cc: Cornelia Huck <cohuck@redhat.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jan 03, 2022 at 11:55:09AM +0000, Longpeng (Mike, Cloud Infrastructure Service Product Dept.) wrote:
> 
> 
> > -----Original Message-----
> > From: Cornelia Huck [mailto:cohuck@redhat.com]
> > Sent: Monday, January 3, 2022 7:30 PM
> > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > <longpeng2@huawei.com>; Michael S. Tsirkin <mst@redhat.com>
> > Cc: Gonglei (Arei) <arei.gonglei@huawei.com>;
> > virtio-comment@lists.oasis-open.org
> > Subject: Re: [virtio-comment] RE: [PATCH] content: reserve virtio device ID for
> > QingTian Box devices
> > 
> > On Mon, Dec 27 2021, "Longpeng (Mike, Cloud Infrastructure Service Product
> > Dept.)"	<longpeng2@huawei.com> wrote:
> > 
> > >> -----Original Message-----
> > >> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> > >> Sent: Monday, December 27, 2021 4:15 PM
> > >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> > >> <longpeng2@huawei.com>
> > >> Cc: Gonglei (Arei) <arei.gonglei@huawei.com>;
> > >> virtio-comment@lists.oasis-open.org
> > >> Subject: Re: [PATCH] content: reserve virtio device ID for QingTian Box devices
> > >>
> > >> On Thu, Dec 23, 2021 at 02:49:25PM +0000, Longpeng (Mike, Cloud Infrastructure
> > >> Service Product Dept.) wrote:
> > >> > Hi Michael,
> > >> >
> > >> > Is there anything else I need to do to reserve the device id?
> > >>
> > >> OK, I see the issue was created. I think it makes sense to wait
> > >> until Jan 3 with the vote since lots of people are on
> > >> vacation.
> > >>
> > >
> > > Ok, thanks.
> > >
> > >> Meanwhile - are there plans to add this device to the spec eventually?
> > >> Can you share a bit more of what it does?
> > >>
> > >
> > > We want to carve out some resources (e.g. vcpu, mem, pci_dev) from the user's
> > > VM and then use these resources to start a sandbox for the user. The usage
> > > quite likes the software enclave which Nitro already supported, but we have
> > > much wider usage, for example, running unikernel + app (e.g. OSV + Redis) in
> > > the sandbox, it would provide much better performance than the traditional
> > > os.
> > 
> > Sounds interesting. One question: Should this virtio device only support
> > a specific hypervisor, or could it support various hypervisors in
> > theory? (Via different commands or parameters.) In case of the latter,
> > it might be better to reserve an ID for a "sandbox device" or so. If the
> > design is too closely tied to your hypervisor, I'd be fine with
> > reserving the ID as proposed.
> 
> We want to name the device as "virtio sandbox" originally, but consider that it
> would be much convenient to add new features (maybe tied to our hypervisor) in 
> the future if we introduce a private device, so we decide to use "QingTian Box" 
> at last.
> 
> However, the sandbox function is not bound to a specific hypervisor, so it's free
> for the other guys to add something like "virtio sandbox".

Hard to say of course but I'm guessing it's better to give it a generic
name. Part of the appeal of virtio is it's hypervisor agnostic,
hypervisor specific extensions can always be moved to a separate device.

-- 
MST

