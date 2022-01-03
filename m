Return-Path: <virtio-comment-return-2482-cohuck=redhat.com@lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 53DE9986207
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Jan 2022 15:48:49 +0000 (UTC)
Date: Mon, 3 Jan 2022 10:48:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
Message-ID: <20220103104443-mutt-send-email-mst@kernel.org>
References: <20211209140543.1876-1-longpeng2@huawei.com>
 <d09a2b0c1cee4d2180b33c452a42794c@huawei.com>
 <20211227031128-mutt-send-email-mst@kernel.org>
 <2be7836713cc4d06ba24b86d21d18094@huawei.com>
 <87o84t3vm8.fsf@redhat.com>
 <761e286875084a79837e7a68eb431055@huawei.com>
 <87lezx3rw6.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87lezx3rw6.fsf@redhat.com>
Subject: Re: [virtio-comment] RE: [PATCH] content: reserve virtio device ID
 for QingTian Box devices
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
To: Cornelia Huck <cohuck@redhat.com>
Cc: "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)" <longpeng2@huawei.com>, "Gonglei (Arei)" <arei.gonglei@huawei.com>, "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
List-ID: <virtio-comment.lists.oasis-open.org>

On Mon, Jan 03, 2022 at 01:50:17PM +0100, Cornelia Huck wrote:
> On Mon, Jan 03 2022, "Longpeng (Mike, Cloud Infrastructure Service Product Dept.)"	<longpeng2@huawei.com> wrote:
> 
> >> -----Original Message-----
> >> From: Cornelia Huck [mailto:cohuck@redhat.com]
> >> Sent: Monday, January 3, 2022 7:30 PM
> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> >> <longpeng2@huawei.com>; Michael S. Tsirkin <mst@redhat.com>
> >> Cc: Gonglei (Arei) <arei.gonglei@huawei.com>;
> >> virtio-comment@lists.oasis-open.org
> >> Subject: Re: [virtio-comment] RE: [PATCH] content: reserve virtio device ID for
> >> QingTian Box devices
> >> 
> >> On Mon, Dec 27 2021, "Longpeng (Mike, Cloud Infrastructure Service Product
> >> Dept.)"	<longpeng2@huawei.com> wrote:
> >> 
> >> >> -----Original Message-----
> >> >> From: Michael S. Tsirkin [mailto:mst@redhat.com]
> >> >> Sent: Monday, December 27, 2021 4:15 PM
> >> >> To: Longpeng (Mike, Cloud Infrastructure Service Product Dept.)
> >> >> <longpeng2@huawei.com>
> >> >> Cc: Gonglei (Arei) <arei.gonglei@huawei.com>;
> >> >> virtio-comment@lists.oasis-open.org
> >> >> Subject: Re: [PATCH] content: reserve virtio device ID for QingTian Box devices
> >> >>
> >> >> On Thu, Dec 23, 2021 at 02:49:25PM +0000, Longpeng (Mike, Cloud Infrastructure
> >> >> Service Product Dept.) wrote:
> >> >> > Hi Michael,
> >> >> >
> >> >> > Is there anything else I need to do to reserve the device id?
> >> >>
> >> >> OK, I see the issue was created. I think it makes sense to wait
> >> >> until Jan 3 with the vote since lots of people are on
> >> >> vacation.
> >> >>
> >> >
> >> > Ok, thanks.
> >> >
> >> >> Meanwhile - are there plans to add this device to the spec eventually?
> >> >> Can you share a bit more of what it does?
> >> >>
> >> >
> >> > We want to carve out some resources (e.g. vcpu, mem, pci_dev) from the user's
> >> > VM and then use these resources to start a sandbox for the user. The usage
> >> > quite likes the software enclave which Nitro already supported, but we have
> >> > much wider usage, for example, running unikernel + app (e.g. OSV + Redis) in
> >> > the sandbox, it would provide much better performance than the traditional
> >> > os.
> >> 
> >> Sounds interesting. One question: Should this virtio device only support
> >> a specific hypervisor, or could it support various hypervisors in
> >> theory? (Via different commands or parameters.) In case of the latter,
> >> it might be better to reserve an ID for a "sandbox device" or so. If the
> >> design is too closely tied to your hypervisor, I'd be fine with
> >> reserving the ID as proposed.
> >
> > We want to name the device as "virtio sandbox" originally, but consider that it
> > would be much convenient to add new features (maybe tied to our hypervisor) in 
> > the future if we introduce a private device, so we decide to use "QingTian Box" 
> > at last.
> >
> > However, the sandbox function is not bound to a specific hypervisor, so it's free
> > for the other guys to add something like "virtio sandbox".
> 
> Yes, I guess this is a tradeoff between "device for a closely defined
> environment that can be specified/changed easily" and "generic device
> covering different environments that gets very complex". I do not have a
> very good grasp of the problem space; if it is hard to make generic, I
> have no objection to the specific device id.
> 
> Anyone else have a comment? If not, we can go ahead and start a vote.

I'd like to know whether there are plans to add the device to the spec?
Driver to linux?

-- 
MST


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

