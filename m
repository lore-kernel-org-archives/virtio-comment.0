Return-Path: <virtio-comment-return-8352-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 530F3C4332F
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 07:57:21 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 849972A8E1
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 07:57:20 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67E9F986D6E
	for <virtio-comment@archiver.kernel.org>; Tue, 14 Nov 2023 07:57:20 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4CA8C986D66; Tue, 14 Nov 2023 07:57:20 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3D1FE986D67
	for <virtio-comment@lists.oasis-open.org>; Tue, 14 Nov 2023 07:57:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DOxLrQAMPX6cQHynzRLxSA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699948635; x=1700553435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMweQukO8pWwvI5ijW8FRq3kfs+8eob54bI+h5kwFbk=;
        b=q+L9l6VGy/9bgyHDVA6FVLIyd2OYgXfvzNdF1l96e6C4h+Lnh2r/MGJn25drhlQ5u+
         aZ5a2QMS7MFJMY6z2TxuLLzfQ0bVRy/68f7wCApM3Tvx+QHrYWbOdMHVTPML5bWInI3w
         2GuOa0N8rBqzb+H539GDa0kNGQ5Fhb8UCsuzeWkqyhqEWkLZ5Dp7g9i7huWBmbWvRyDs
         0QyaocCOQ1A0vlbY1t+puxjbl8Lg94kqJ4fWfQjzWGi3iPJ7CqwW3c6XwqnMxSKI3AF8
         h2S3pXQV8U8woxRL6PfsS7Jjgwh637NRzf6Y1AhG8Y2z5TWnErlJTrUcE8ASLT/z7lUJ
         ZzpA==
X-Gm-Message-State: AOJu0Yx8XctbZFz9V8H1y/M7SK3HmXpdoSnDyZBmZEY7BFObTK7HalQz
	KHOXWSNzcUJail3d7GJ3/tIwnhRP+9iV79Myfp9OkvLeY1E0YT0+q/UZXia7KAhINVHQIk22VK0
	fDjCXAyJWcs1Eu5qm0m8I38NIyKUF/W1t5GBpOlvOWU6epjrbMg==
X-Received: by 2002:ac2:4c38:0:b0:4f3:9136:9cd0 with SMTP id u24-20020ac24c38000000b004f391369cd0mr5714890lfq.44.1699948634710;
        Mon, 13 Nov 2023 23:57:14 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGofAmfQJ3luoivPstmGjUHca8C/fUfqQTXcsF/IguZPFYjWSsUxBzkwOrNVcYKubKfOa64b2ztjxO5ZSJFndw=
X-Received: by 2002:ac2:4c38:0:b0:4f3:9136:9cd0 with SMTP id
 u24-20020ac24c38000000b004f391369cd0mr5714825lfq.44.1699948632146; Mon, 13
 Nov 2023 23:57:12 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB54814420718AB387C0C84C07DCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtGvDxF1Dnb6FJDK8XEAUcast-7OnuzTyfAr7m0LURWMw@mail.gmail.com>
 <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org> <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org> <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org> <CACGkMEuSpZ0Y8kxXv26b38pvX--OCdvWm5KvMniqo=W10ruBTA@mail.gmail.com>
 <20231113013016-mutt-send-email-mst@kernel.org>
In-Reply-To: <20231113013016-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Tue, 14 Nov 2023 15:57:01 +0800
Message-ID: <CACGkMEuRuZe61KQwQ7Urz+TVGLFZUrTAv1MggdTTk60YFM=njA@mail.gmail.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>, 
	"cohuck@redhat.com" <cohuck@redhat.com>, "sburla@marvell.com" <sburla@marvell.com>, 
	Shahaf Shuler <shahafs@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>, 
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write recording commands

On Mon, Nov 13, 2023 at 2:57=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Nov 13, 2023 at 11:31:37AM +0800, Jason Wang wrote:
> > On Thu, Nov 9, 2023 at 3:59=E2=80=AFPM Michael S. Tsirkin <mst@redhat.c=
om> wrote:
> > >
> > > On Thu, Nov 09, 2023 at 11:31:27AM +0800, Jason Wang wrote:
> > > > On Wed, Nov 8, 2023 at 4:17=E2=80=AFPM Michael S. Tsirkin <mst@redh=
at.com> wrote:
> > > > >
> > > > > On Wed, Nov 08, 2023 at 12:28:36PM +0800, Jason Wang wrote:
> > > > > > On Tue, Nov 7, 2023 at 3:05=E2=80=AFPM Michael S. Tsirkin <mst@=
redhat.com> wrote:
> > > > > > >
> > > > > > > On Tue, Nov 07, 2023 at 12:04:29PM +0800, Jason Wang wrote:
> > > > > > > > > > > Each virtio and non virtio devices who wants to repor=
t their dirty page report,
> > > > > > > > > > will do their way.
> > > > > > > > > > >
> > > > > > > > > > > > 3) inventing it in the virtio layer will be depreca=
ted in the future
> > > > > > > > > > > > for sure, as platform will provide much rich featur=
es for logging
> > > > > > > > > > > > e.g it can do it per PASID etc, I don't see any rea=
son virtio need
> > > > > > > > > > > > to compete with the features that will be provided =
by the platform
> > > > > > > > > > > Can you bring the cpu vendors and committement to vir=
tio tc with timelines
> > > > > > > > > > so that virtio TC can omit?
> > > > > > > > > >
> > > > > > > > > > Why do we need to bring CPU vendors in the virtio TC? V=
irtio needs to be built
> > > > > > > > > > on top of transport or platform. There's no need to dup=
licate their job.
> > > > > > > > > > Especially considering that virtio can't do better than=
 them.
> > > > > > > > > >
> > > > > > > > > I wanted to see a strong commitment for the cpu vendors t=
o support dirty page tracking.
> > > > > > > >
> > > > > > > > The RFC of IOMMUFD support can go back to early 2022. Intel=
, AMD and
> > > > > > > > ARM are all supporting that now.
> > > > > > > >
> > > > > > > > > And the work seems to have started for some platforms.
> > > > > > > >
> > > > > > > > Let me quote from the above link:
> > > > > > > >
> > > > > > > > """
> > > > > > > > Today, AMD Milan (or more recent) supports it while ARM SMM=
Uv3.2
> > > > > > > > alongside VT-D rev3.x also do support.
> > > > > > > > """
> > > > > > > >
> > > > > > > > > Without such platform commitment, virtio also skipping it=
 would not work.
> > > > > > > >
> > > > > > > > Is the above sufficient? I'm a little bit more familiar wit=
h vtd, the
> > > > > > > > hw feature has been there for years.
> > > > > > >
> > > > > > >
> > > > > > > Repeating myself - I'm not sure that will work well for all w=
orkloads.
> > > > > >
> > > > > > I think this comment applies to this proposal as well.
> > > > >
> > > > > Yes - some systems might be better off with platform tracking.
> > > > > And I think supporting shadow vq better would be nice too.
> > > >
> > > > For shadow vq, did you mean the work that is done by Eugenio?
> > >
> > > Yes.
> >
> > That's exactly why vDPA starts with shadow virtqueue. We've evaluated
> > various possible approaches, each of them have their shortcomings and
> > shadow virtqueue is the only one that doesn't require any additional
> > hardware features to work in every platform.
>
> What I would like to see is effort to switch shadow on/off not keep it
> on at all times. That's only good enough for a PoC. And to work on top
> of virtio that will require effort in the spec.

Well, there're various approaches. If we just care about the shadow vq
on/off. Virtqueue indexes plus inflight should be sufficient.

Talking about the future, since vDPA allows to conditionally trap a
virtqueue via ASID. I expect virtio can do the same if PASID is
supported (and there used to be a proposal for this in the past).

>  If I see spec patches
> that do that I personally would support that.  It needs to be reasonably
> generic though, a single 16 bit RW number is not going to be enough.

It's really device specific, vDPA has demonstrated that it's
sufficient for networking devices.

> I
> think it's likely admin commands is a good interface for this. If it's a
> hack making vendor specific assumptions, just keep it in vdpa.

This part I don't understand. Most of the virtqueue states were
accessed via common_cfg, I don't see the advantages of separating the
others in other places unless there's a new transport.

>
> > >
> > > > >
> > > > > > > Definitely KVM did
> > > > > > > not scan PTEs. It used pagefaults with bit per page and later=
 as VM size
> > > > > > > grew switched to PLM.  This interface is analogous to PLM,
> > > > > >
> > > > > > I think you meant PML actually. And it doesn't work like PML. T=
o
> > > > > > behave like PML it needs to
> > > > > >
> > > > > > 1) log buffers were organized as a queue with indices
> > > > > > 2) device needs to suspend (as a #vmexit in PML) if it runs out=
 of the buffers
> > > > > > 3) device need to send a notification to the driver if it runs =
out of the buffer
> > > > > >
> > > > > > I don't see any of the above in this proposal. If we do that it=
 would
> > > > > > be less problematic than what is being proposed here.
> > > > >
> > > > > What is common between this and PML is that you get the addresses
> > > > > directly without scanning megabytes of bitmaps or worse -
> > > > > hundreds of megabytes of page tables.
> > > >
> > > > Yes, it has overhead but this is the method we use for vhost and KV=
M (earlier).
> > > >
> > > > To me the  important advantage of PML is that it uses limited
> > > > resources on the host which
> > > >
> > > > 1) doesn't require resources in the device
> > > > 2) doesn't scale as the guest memory increases. (but this advantage
> > > > doesn't exist in neither this nor bitmap)
> > >
> > > it seems 2 exactly exists here.
> >
> > Actually not, Parav said the device needs to reserve sufficient
> > resources in another thread.
> >
> > >
> > >
> > > > >
> > > > > The data structure is different but I don't see why it is critica=
l.
> > > > >
> > > > > I agree that I don't see out of buffers notifications too which i=
mplies
> > > > > device has to maintain something like a bitmap internally.  Which=
 I
> > > > > guess could be fine but it is not clear to me how large that bitm=
ap has
> > > > > to be. How does the device know? Needs to be addressed.
> > > >
> > > > This is the question I asked Parav in another thread. Using host
> > > > memory as a queue with notification (like PML) might be much better=
.
> > >
> > > Well if queue is what you want to do you can just do it internally.
> >
> > Then it's not the proposal here, Parav has explained it in another
> > reply, and as explained it lacks a lot of other facilities.
> >
> > > Problem of course is that it might overflow and cause things like
> > > packet drops.
> >
> > Exactly like PML. So sticking to wire speed should not be a general
> > goal in the context of migration. It can be done if the speed of the
> > migration interface is faster than the virtio device that needs to be
> > migrated.
>
> People buy hardware to improve performance. Apparently there are people
> who want to build this hardware.

We are talking about different things. What I'm saying is that
sticking to wire speed somehow conflicts with the goal of downtime. If
mgmt/guest doesn't allow to increase the downtime, it's very hard to
stick the wirespeed during live dirty page tracking. This doesn't
prevent people from building and using faster hardware, the hardware
might just run slower when doing live migration. If I was wrong,
please explain why.

> It is not our role to tell either
> of the groups "this should not be a general goal".

Well, the downtime has been well studied and used for years, and I
describe the assumptions:

"
It can be done if the speed of the migration interface is faster than
the virtio device that needs to be migrated.
"

KVM and Qemu have a lot of mechanisms to throttle as well.

>
>
> > >
> > >
> > > > >
> > > > >
> > > > > > Even if we manage to do that, it doesn't mean we won't have iss=
ues.
> > > > > >
> > > > > > 1) For many reasons it can neither see nor log via GPA, so this
> > > > > > requires a traversal of the vIOMMU mapping tables by the hyperv=
isor
> > > > > > afterwards, it would be expensive and need synchronization with=
 the
> > > > > > guest modification of the IO page table which looks very hard.
> > > > >
> > > > > vIOMMU is fast enough to be used on data path but not fast enough=
 for
> > > > > dirty tracking?
> > > >
> > > > We set up SPTEs or using nesting offloading where the PTEs could be
> > > > iterated by hardware directly which is fast.
> > >
> > > There's a way to have hardware find dirty PTEs for you quickly?
> >
> > Scanning PTEs on the host is faster and more secure than scanning
> > guests, that's what I want to say:
> >
> > 1) the guest page could be swapped out but not the host one.
> > 2) no guest triggerable behavior
> >
> > > I don't know how it's done. Do tell.
> > >
> > >
> > > > This is not the case here where software needs to iterate the IO pa=
ge
> > > > tables in the guest which could be slow.
> > > >
> > > > > Hard to believe.  If true and you want to speed up
> > > > > vIOMMU then you implement an efficient datastructure for that.
> > > >
> > > > Besides the issue of performance, it's also racy, assuming we are l=
ogging IOVA.
> > > >
> > > > 0) device log IOVA
> > > > 1) hypervisor fetches IOVA from log buffer
> > > > 2) guest map IOVA to a new GPA
> > > > 3) hypervisor traverse guest table to get IOVA to new GPA
> > > >
> > > > Then we lost the old GPA.
> > >
> > > Interesting and a good point.
> >
> > Note that PML logs at GPA as it works at L1 of EPT.
>
> And that's perfect for migration.

Right.

>
> > > And by the way e.g. vhost has the same
> > > issue.  You need to flush dirty tracking info when changing the mappi=
ngs
> > > somehow.
> >
> > It's not,
> >
> > 1) memory translation is done by vhost
> > 2) vhost knows GPA and it doesn't log via IOVA.
> >
> > See this for example, and DPDK has similar fixes.
> >
> > commit cc5e710759470bc7f3c61d11fd54586f15fdbdf4
> > Author: Jason Wang <jasowang@redhat.com>
> > Date:   Wed Jan 16 16:54:42 2019 +0800
> >
> >     vhost: log dirty page correctly
> >
> >     Vhost dirty page logging API is designed to sync through GPA. But w=
e
> >     try to log GIOVA when device IOTLB is enabled. This is wrong and ma=
y
> >     lead to missing data after migration.
> >
> >     To solve this issue, when logging with device IOTLB enabled, we wil=
l:
> >
> >     1) reuse the device IOTLB translation result of GIOVA->HVA mapping =
to
> >        get HVA, for writable descriptor, get HVA through iovec. For use=
d
> >        ring update, translate its GIOVA to HVA
> >     2) traverse the GPA->HVA mapping to get the possible GPA and log
> >        through GPA. Pay attention this reverse mapping is not guarantee=
d
> >        to be unique, so we should log each possible GPA in this case.
> >
> >     This fix the failure of scp to guest during migration. In -next, we
> >     will probably support passing GIOVA->GPA instead of GIOVA->HVA.
> >
> >     Fixes: 6b1e6cc7855b ("vhost: new device IOTLB API")
> >     Reported-by: Jintack Lim <jintack@cs.columbia.edu>
> >     Cc: Jintack Lim <jintack@cs.columbia.edu>
> >     Signed-off-by: Jason Wang <jasowang@redhat.com>
> >     Acked-by: Michael S. Tsirkin <mst@redhat.com>
> >     Signed-off-by: David S. Miller <davem@davemloft.net>
> >
> > All of the above is not what virtio did right now.
>
> Any IOMMU flushes IOTLB on translation changes. If vhost doesn't then
> it's highly likely to be a bug.

It is exactly what vhost did.

>
>
> > > Parav what's the plan for this? Should be addressed in the
> > > spec too.
> > >
> >
> > AFAIK, there's no easy/efficient way to do that. I hope I was wrong.
> >
> > >
> > >
> > > > >
> > > > > > 2) There are a lot of special or reserved IOVA ranges (for exam=
ple the
> > > > > > interrupt areas in x86) that need special care which is archite=
ctural
> > > > > > and where it is beyond the scope or knowledge of the virtio dev=
ice but
> > > > > > the platform IOMMU. Things would be more complicated when SVA i=
s
> > > > > > enabled.
> > > > >
> > > > > SVA being what here?
> > > >
> > > > For example, IOMMU may treat interrupt ranges differently depending=
 on
> > > > whether SVA is enabled or not. It's very hard and unnecessary to te=
ach
> > > > devices about this.
> > >
> > > Oh, shared virtual memory. So what you are saying here? virtio
> > > does not care, it just uses some addresses and if you want it to
> > > it can record writes somewhere.
> >
> > One example, PCI allows devices to send translated requests, how can a
> > hypervisor know it's a PA or IOVA in this case? We probably need a new
> > bit. But it's not the only thing we need to deal with.
>
> virtio must always log PA.

How? Without ATS, the device can't see PA since it can only use
untranslated requests ...

>
>
> > By definition, interrupt ranges and other reserved ranges should not
> > belong to dirty pages. And the logging should be done before the DMA
> > where there's no way for the device to know whether or not an IOVA is
> > valid or not. It would be more safe to just not report them from the
> > source instead of leaving it to the hypervisor to deal with but this
> > seems impossible at the device level. Otherwise the hypervisor driver
> > needs to communicate with the (v)IOMMU to be reached with the
> > interrupt(MSI) area, RMRR area etc in order to do the correct things
> > or it might have security implications. And those areas don't make
> > sense at L1 when vSVA is enabled. What's more, when vIOMMU could be
> > fully offloaded, there's no easy way to fetch that information.
> >
> > Again, it's hard to bypass or even duplicate the functionality of the
> > platform or we need to step into every single detail of a specific
> > transport, architecture or IOMMU to figure out whether or not logging
> > at virtio is correct which is awkward and unrealistic. This proposal
> > suffers from an exact similar issue when inventing things like
> > freeze/stop where I've pointed out other branches of issues as well.
>
>
> Exactly it's a mess.  Instead of making everything 10x more complex,
> let's just keep talking about PA and leave translation to IOMMU.

For many reasons, the device can't see PA.

Even with PA, it's still problematic, is it GPA or HPA? GPA may only
work if the device is abstracted as two dimension I/O page tables like
IOMMU. For HPA, we can't just report it to the userspace which
requires a software translation again. What's more, as stated above,
there's no way for the device to know if the PA is valid or not
(unless there's an ATS), logging an invalid PA is dangerous and may
have security implications.

>
>
> > >
> > > > >
> > > > > > And there could be other architecte specific knowledge (e.g
> > > > > > PAGE_SIZE) that might be needed. There's no easy way to deal wi=
th
> > > > > > those cases.
> > > > >
> > > > > Good point about page size actually - using 4k unconditionally
> > > > > is a waste of resources.
> > > >
> > > > Actually, they are more than just PAGE_SIZE, for example, PASID and=
 others.
> > >
> > > what does pasid have to do with it? anyway, just give driver control
> > > over page size.
> >
> > For example, two virtqueues have two PASIDs assigned. How can a
> > hypervisor know which specific IOVA belongs to which IOVA? For
> > platform IOMMU, they are handy as it talks to the transport. But I
> > don't think we need to duplicate every transport specific address
> > space feature in core virtio layer:
> >
> > 1) translated/untranslated request
> > 2) request w/ and w/o PASID
>
> Can't say I understand. All the talk about IOVA is just confusing -
> what we care about for logging is which page to resend.

See above.

>
> > > > >
> > > > >
> > > > > > We wouldn't need to care about all of them if it is done at pla=
tform
> > > > > > IOMMU level.
> > > > >
> > > > > If someone logs at IOMMU level then nothing needs to be done
> > > > > in the spec at all. This is about capability at the device level.
> > > >
> > > > True, but my question is where or not it can be done at the device =
level easily.
> > >
> > > there's no "easily" about live migration ever.
> >
> > I think I've stated sufficient issues to demonstrate how hard virtio
> > wants to do it. And I've given the link that it is possible to do that
> > in IOMMU without those issues. So in this context doing it in virtio
> > is much harder.
>
> Code walks though.

There's even no code work from Parav to describe how it can work for a
hypervisor.

>
>
> > > For example on-device iommus are a thing.
> >
> > I'm not sure that's the way to go considering the platform IOMMU
> > evolves very quickly.
>
> What do you refer to? People buy hardware and use it for years
> with no chance to add features.

IOMMU evolves quickly, duplicating its functionality looks like a
re-inventing of the wheels.

Again, I think we don't want to suffer from the hard times in
bypassing the platform IOMMU again like in the past.

>
>
> > >
> > > > >
> > > > >
> > > > > > > what Lingshan
> > > > > > > proposed is analogous to bit per page - problem unfortunately=
 is
> > > > > > > you can't easily set a bit by DMA.
> > > > > > >
> > > > > >
> > > > > > I'm not saying bit/bytemap is the best, but it has been used by=
 real
> > > > > > hardware. And we have many other options.
> > > > > >
> > > > > > > So I think this dirty tracking is a good option to have.
> > > > > > >
> > > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > > > i.e. in first year of 2024?
> > > > > > > > > >
> > > > > > > > > > Why does it matter in 2024?
> > > > > > > > > Because users needs to use it now.
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > If not, we are better off to offer this, and when/if =
platform support is, sure,
> > > > > > > > > > this feature can be disabled/not used/not enabled.
> > > > > > > > > > >
> > > > > > > > > > > > 4) if the platform support is missing, we can use s=
oftware or
> > > > > > > > > > > > leverage transport for assistance like PRI
> > > > > > > > > > > All of these are in theory.
> > > > > > > > > > > Our experiment shows PRI performance is 21x slower th=
an page fault rate
> > > > > > > > > > done by the cpu.
> > > > > > > > > > > It simply does not even pass a simple 10Gbps test.
> > > > > > > > > >
> > > > > > > > > > If you stick to the wire speed during migration, it can=
 converge.
> > > > > > > > > Do you have perf data for this?
> > > > > > > >
> > > > > > > > No, but it's not hard to imagine the worst case. Wrote a sm=
all program
> > > > > > > > that dirty every page by a NIC.
> > > > > > > >
> > > > > > > > > In the internal tests we don=E2=80=99t see this happening=
.
> > > > > > > >
> > > > > > > > downtime =3D dirty_rates * PAGE_SIZE / migration_speed
> > > > > > > >
> > > > > > > > So if we get very high dirty rates (e.g by a high speed NIC=
), we can't
> > > > > > > > satisfy the requirement of the downtime. Or if you see the =
converge,
> > > > > > > > you might get help from the auto converge support by the hy=
pervisors
> > > > > > > > like KVM where it tries to throttle the VCPU then you can't=
 reach the
> > > > > > > > wire speed.
> > > > > > >
> > > > > > > Will only work for some device types.
> > > > > > >
> > > > > >
> > > > > > Yes, that's the point. Parav said he doesn't see the issue, it'=
s
> > > > > > probably because he is testing a virtio-net and so the vCPU is
> > > > > > automatically throttled. It doesn't mean it can work for other =
virito
> > > > > > devices.
> > > > >
> > > > > Only for TX, and I'm pretty sure they had the foresight to test R=
X not
> > > > > just TX but let's confirm. Parav did you test both directions?
> > > >
> > > > RX speed somehow depends on the speed of refill, so throttling help=
s
> > > > more or less.
> > >
> > > It doesn't depend on speed of refill you just underrun and drop
> > > packets. then your nice 10usec latency becomes more like 10sec.
> >
> > I miss your point here. If the driver can't achieve wire speed without
> > dirty page tracking, it can neither when dirty page tracking is
> > enabled.
>
> My point is PRI causes rx ring underruns and throttling CPU makes it
> worse not better. And I believe people actually tried, nvidia
> have a pri implementation in hardware. If they come and say
> virtio help is needed for performance I tend to believe them.

I'm not saying I'm not trusting NV. It's not about trust at all, I'm
saying: if they fail with PRI,

1) if there's any fault in virtio that damages the performance of PRI,
let's fix it in virtio
2) if it's not the fault of virtio in the context of PRI, it doesn't
necessarily mean logging via virtio is the only way to go, we can seek
support from others which fit better

Unfortunately, they didn't explain why they chose to do it in virtio
until I pointed out the issues.

>
>
>
> > >
> > > > >
> > > > > > >
> > > > > > >
> > > > > > > > >
> > > > > > > > > >
> > > > > > > > > > > There is no requirement for mandating PRI either.
> > > > > > > > > > > So it is unusable.
> > > > > > > > > >
> > > > > > > > > > It's not about mandating, it's about doing things in th=
e correct layer. If PRI is
> > > > > > > > > > slow, PCI can evolve for sure.
> > > > > > > > > You should try.
> > > > > > > >
> > > > > > > > Not my duty, I just want to make sure things are done in th=
e correct
> > > > > > > > layer, and once it needs to be done in the virtio, there's =
nothing
> > > > > > > > obviously wrong.
> > > > > > >
> > > > > > > Yea but just vague questions don't help to make sure eiter wa=
y.
> > > > > >
> > > > > > I don't think it's vague, I have explained, if something in the=
 virito
> > > > > > slows down the PRI, we can try to fix them.
> > > > >
> > > > > I don't believe you are going to make PRI fast. No one managed so=
 far.
> > > >
> > > > So it's the fault of PRI not virito, but it doesn't mean we need to=
 do
> > > > it in virtio.
> > >
> > > I keep saying with this approach we would just say "e1000 emulation i=
s
> > > slow and encumbered this is the fault of e1000" and never get virtio =
at
> > > all.  Assigning blame only gets you so far.
> >
> > I think we are discussing different things. My point is virtio needs
> > to leverage the functionality provided by transport or platform
> > (especially considering they evolve faster than virtio). It seems to
> > me it's hard even to duplicate some basic function of platform IOMMU
> > in virtio.
>
> Dirty tracking in the IOMMU is annoying enough that I am not

What issue did you see? We can report them to platform vendors anyhow.

> sure it's usable. Go ahead but I want to see patches then.

If we agree to log via IOMMU what kind of patches did you expect to see?

>
> > >
> > > > >
> > > > > > Missing functions in
> > > > > > platform or transport is not a good excuse to try to workaround=
 it in
> > > > > > the virtio. It's a layer violation and we never had any feature=
 like
> > > > > > this in the past.
> > > > >
> > > > > Yes missing functionality in the platform is exactly why virtio
> > > > > was born in the first place.
> > > >
> > > > Well the platform can't do device specific logic. But that's not th=
e
> > > > case of dirty page tracking which is device logic agnostic.
> > >
> > > Not true platforms have things like NICs on board and have for many
> > > years. It's about performance really.
> >
> > I've stated sufficient issues above. And one more obvious issue for
> > device initiated page logging is that it needs a lot of extra or
> > unnecessary PCI transactions which will throttle the performance of
> > the whole system (and lead to other issues like QOS).
>
> Maybe. This kind of statement is just vague enough not to be falsifiable.

I don't think so. It could be falsifiable if some vendor comes with
real numbers:

1) demonstrate the possibility of converging a migration when virito
is running at wire speed
2) demonstrate logging dirty pages in one VF doesn't damage the
performance of other

with reasonable explanations. It's not hard to test the above two simple ca=
ses.

>
> > So I can't
> > believe it has good performance overall. Logging via IOMMU or using
> > shadow virtqueue doesn't need any extra PCI transactions at least.
>
> On the other hand they have an extra CPU cost.

This is the way current vhost is working. We know the pros/cons. And
there are many ways to limit the bandwidth/QOS of a software based
dirty tracking.

> Personally if this is
> coming from a hardware vendor, I am inclined to trust them wrt PCI
> transactions.

The point is not about trust. I think Parav has said in another thread
that RX performance is throttled by the dirty tracking.

> But anyway, discussing this at a high level theoretically
> is pointless -

As a reviewer, the most important thing for me is to make sure the
proposal is theoretically correct before I can go through the details.

> whoever bothers with actual prototyping for performance
> testing wins,

This part I don't understand.

LingShan has given you the proof that Intel has done it several years
ago. And shadow virtqueue is inspired by those works as well.
LingShan's proposal is based on those experiences and that's why
LingShan's proposal does not come with dirty page tracking.

My understanding is, being an open device standard, the spec needs to
seek the best way to go instead of just one of the possible ways to
go. We never claim "we are the first so let's go with my way".

> if no one does I'd expect a back of a napkin estimate
> to be included.

I'd expect any huge feature like this needs to be prototyped before
they can be discussed or it needs to be tagged as RFC.

Thanks






>
>
>
> > > So I'd like Parav to publish some
> > > experiment results and/or some estimates.
> > >
> >
> > That's fine, but the above equation (used by Qemu) is sufficient to
> > demonstrate how hard to stick wire speed in the case.
> >
> > >
> > > > >
> > > > > > >
> > > > > > > > > In the current state, it is mandating.
> > > > > > > > > And if you think PRI is the only way,
> > > > > > > >
> > > > > > > > I don't, it's just an example where virtio can leverage fro=
m either
> > > > > > > > transport or platform. Or if it's the fault in virtio that =
slows down
> > > > > > > > the PRI, then it is something we can do.
> > > > > > > >
> > > > > > > > >  than you should propose that in the dirty page tracking =
series that you listed above to not do dirty page tracking. Rather depend o=
n PRI, right?
> > > > > > > >
> > > > > > > > No, the point is to not duplicate works especially consider=
ing virtio
> > > > > > > > can't do better than platform or transport.
> > > > > > >
> > > > > > > If someone says they tried and platform's migration support d=
oes not
> > > > > > > work for them and they want to build a solution in virtio the=
n
> > > > > > > what exactly is the objection?
> > > > > >
> > > > > > The discussion is to make sure whether virtio can do this easil=
y and
> > > > > > correctly, then we can have a conclusion. I've stated some issu=
es
> > > > > > above, and I've asked other questions related to them which are=
 still
> > > > > > not answered.
> > > > > >
> > > > > > I think we had a very hard time in bypassing IOMMU in the past =
that we
> > > > > > don't want to repeat.
> > > > > >
> > > > > > We've gone through several methods of logging dirty pages in th=
e past
> > > > > > (each with pros/cons), but this proposal never explains why it =
chooses
> > > > > > one of them but not others. Spec needs to find the best path in=
stead
> > > > > > of just a possible path without any rationale about why.
> > > > >
> > > > > Adding more rationale isn't a bad thing.
> > > > > In particular if platform supplies dirty tracking then how does
> > > > > driver decide which to use platform or device capability?
> > > > > A bit of discussion around this is a good idea.
> > > > >
> > > > >
> > > > > > > virtio is here in the
> > > > > > > first place because emulating devices didn't work well.
> > > > > >
> > > > > > I don't understand here. We have supported emulated devices for=
 years.
> > > > > > I'm pretty sure a lot of issues could be uncovered if this prop=
osal
> > > > > > can be prototyped with an emulated device first.
> > > > > >
> > > > > > Thanks
> > > > >
> > > > > virtio was originally PV as opposed to emulation. That there's no=
w
> > > > > hardware virtio and you call software implementation "an emulatio=
n" is
> > > > > very meta.
> > > >
> > > > Yes but I don't see how it relates to dirty page tracking. When we
> > > > find a way it should work for both software and hardware devices.
> > > >
> > > > Thanks
> > >
> > > It has to work well on a variety of existing platforms. If it does th=
en
> > > sure, why would we roll our own.
> >
> > If virtio can do that in an efficient way without any issues, I agree.
> > But it seems not.
> >
> > Thanks
>
>
>
> >
> >
> >
> >
> >
> >
> > >
> > > --
> > > MST
> > >
>


This publicly archived list offers a means to provide input to the=0D
OASIS Virtual I/O Device (VIRTIO) TC.=0D
=0D
In order to verify user consent to the Feedback License terms and=0D
to minimize spam in the list archive, subscription is required=0D
before posting.=0D
=0D
Subscribe: virtio-comment-subscribe@lists.oasis-open.org=0D
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org=0D
List help: virtio-comment-help@lists.oasis-open.org=0D
List archive: https://lists.oasis-open.org/archives/virtio-comment/=0D
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf=0D
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists=0D
Committee: https://www.oasis-open.org/committees/virtio/=0D
Join OASIS: https://www.oasis-open.org/join/

