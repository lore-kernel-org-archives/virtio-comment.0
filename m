Return-Path: <virtio-comment-return-2512-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9DA739864EE
	for <virtio-comment@lists.oasis-open.org>; Thu, 13 Jan 2022 12:21:20 +0000 (UTC)
From: Cornelia Huck <cohuck@redhat.com>
In-Reply-To: <f2c52a49eed04ef59785a8b038cfa476@huawei.com>
References: <20211209140543.1876-1-longpeng2@huawei.com>
 <d09a2b0c1cee4d2180b33c452a42794c@huawei.com>
 <20211227031128-mutt-send-email-mst@kernel.org>
 <2be7836713cc4d06ba24b86d21d18094@huawei.com> <87o84t3vm8.fsf@redhat.com>
 <761e286875084a79837e7a68eb431055@huawei.com>
 <20220103121259-mutt-send-email-mst@kernel.org>
 <f2c52a49eed04ef59785a8b038cfa476@huawei.com>
Date: Thu, 13 Jan 2022 13:20:59 +0100
Message-ID: <87a6fzx1w4.fsf@redhat.com>
MIME-Version: 1.0
Subject: RE: [virtio-comment] RE: [PATCH] content: reserve virtio device ID
 for QingTian Box devices
Content-Type: text/plain
To: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>, "Michael S. Tsirkin" <mst@redhat.com>
Cc: "Gonglei (Arei)" <arei.gonglei@huawei.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Tue, Jan 04 2022, "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"	<longpeng2@huawei.com> wrote:

>> -----Original Message-----
>> From: Michael S. Tsirkin [mailto:mst@redhat.com]
>> Sent: Tuesday, January 4, 2022 1:15 AM
>> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> <longpeng2@huawei.com>
>> Cc: Cornelia Huck <cohuck@redhat.com>; Gonglei (Arei)
>> <arei.gonglei@huawei.com>; virtio-comment@lists.oasis-open.org
>> Subject: Re: [virtio-comment] RE: [PATCH] content: reserve virtio device ID for
>> QingTian Box devices
>> 
>> On Mon, Jan 03, 2022 at 11:55:09AM +0000, Longpeng (Mike, Cloud Infrastructure
>> Service Product Dept.) wrote:
>> >
>> >
>> > > -----Original Message-----
>> > > From: Cornelia Huck [mailto:cohuck@redhat.com]
>> > > Sent: Monday, January 3, 2022 7:30 PM
>> > > To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> > > <longpeng2@huawei.com>; Michael S. Tsirkin <mst@redhat.com>
>> > > Cc: Gonglei (Arei) <arei.gonglei@huawei.com>;
>> > > virtio-comment@lists.oasis-open.org
>> > > Subject: Re: [virtio-comment] RE: [PATCH] content: reserve virtio device
>> ID for
>> > > QingTian Box devices
>> > >
>> > > On Mon, Dec 27 2021, "Longpeng (Mike, Cloud Infrastructure Service Product
>> > > Dept.)"	<longpeng2@huawei.com> wrote:
>> > >
>> > > >> -----Original Message-----
>> > > >> From: Michael S. Tsirkin [mailto:mst@redhat.com]
>> > > >> Sent: Monday, December 27, 2021 4:15 PM
>> > > >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
>> > > >> <longpeng2@huawei.com>
>> > > >> Cc: Gonglei (Arei) <arei.gonglei@huawei.com>;
>> > > >> virtio-comment@lists.oasis-open.org
>> > > >> Subject: Re: [PATCH] content: reserve virtio device ID for QingTian Box
>> devices
>> > > >>
>> > > >> On Thu, Dec 23, 2021 at 02:49:25PM +0000, Longpeng (Mike, Cloud
>> Infrastructure
>> > > >> Service Product Dept.) wrote:
>> > > >> > Hi Michael,
>> > > >> >
>> > > >> > Is there anything else I need to do to reserve the device id?
>> > > >>
>> > > >> OK, I see the issue was created. I think it makes sense to wait
>> > > >> until Jan 3 with the vote since lots of people are on
>> > > >> vacation.
>> > > >>
>> > > >
>> > > > Ok, thanks.
>> > > >
>> > > >> Meanwhile - are there plans to add this device to the spec eventually?
>> > > >> Can you share a bit more of what it does?
>> > > >>
>> > > >
>> > > > We want to carve out some resources (e.g. vcpu, mem, pci_dev) from the
>> user's
>> > > > VM and then use these resources to start a sandbox for the user. The usage
>> > > > quite likes the software enclave which Nitro already supported, but we
>> have
>> > > > much wider usage, for example, running unikernel + app (e.g. OSV + Redis)
>> in
>> > > > the sandbox, it would provide much better performance than the traditional
>> > > > os.
>> > >
>> > > Sounds interesting. One question: Should this virtio device only support
>> > > a specific hypervisor, or could it support various hypervisors in
>> > > theory? (Via different commands or parameters.) In case of the latter,
>> > > it might be better to reserve an ID for a "sandbox device" or so. If the
>> > > design is too closely tied to your hypervisor, I'd be fine with
>> > > reserving the ID as proposed.
>> >
>> > We want to name the device as "virtio sandbox" originally, but consider that
>> it
>> > would be much convenient to add new features (maybe tied to our hypervisor)
>> in
>> > the future if we introduce a private device, so we decide to use "QingTian
>> Box"
>> > at last.
>> >
>> > However, the sandbox function is not bound to a specific hypervisor, so it's
>> free
>> > for the other guys to add something like "virtio sandbox".
>> 
>> Hard to say of course but I'm guessing it's better to give it a generic
>
> If the device only support the sandbox function, then I think a generic
> name (e.g. virtio-sandbox) would be fine. But as I said above, we want to
> extend it as a "toolbox" in the near future, not only the sandbox.

Hm. That would be a vendor-specific toolbox device; I'm not sure whether
using that instead of a more generic sandbox device would be a good
idea -- I guess we'd end up with duplication for the sandbox
functionality. Or does the reset of the toolbox functionality interact
with the sandbox functionality?

>
>> name. Part of the appeal of virtio is it's hypervisor agnostic,
>> hypervisor specific extensions can always be moved to a separate device.
>> 
>
> Yes, but we've already introduced a hypervisor specific device (NSM) now,
> why it's hard to reserve just one ID for other vendors? So I really hope
> the TC could give a chance for other vendors to do this, maybe you can
> limit the IDs that a vendor can reserved. 

I'm less worried about introducing a hypervisor-specific id and more
about introducing something that might be better served by a more
generic device with hypervisor-specific subcommands.


This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

