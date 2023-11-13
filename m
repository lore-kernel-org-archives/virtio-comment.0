Return-Path: <virtio-comment-return-8338-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2DD2C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:47:01 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DC320613CD
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:47:00 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B51FA9867BF
	for <virtio-comment@archiver.kernel.org>; Mon, 13 Nov 2023 03:47:00 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 958AC9865BD; Mon, 13 Nov 2023 03:47:00 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 830449865C1
	for <virtio-comment@lists.oasis-open.org>; Mon, 13 Nov 2023 03:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: THIHXzoUNdCN7wP-pdQvfw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699847216; x=1700452016;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4/Bu3uuWe8wL/uFpWwz/sDiUNbiOXgTzS1/5MsTVmj8=;
        b=T8xuGeCw/VWcqcKJ4+3PWHSkKMU+jeto5GHJUW5wEyuOfqR86iMNC9Orsj2jIP74sl
         yjOrm7qgkO5tPi0/NoypV1B7uiMQHehwVTmXwVC5pxEsX++oyOlnRa0/VYLEFC0SbF/R
         F/FFAXVrgWiyg+vFCKcQqJ9igNJlXfIzBnObhzKQuaVfZw0AnOOzU5X2nT5hJ3B7s8/p
         wKQ4jmIaBXbYDhNN/S6kD55H3oOWP1Z5h6gtXeSKb4J5novNZcdyfxd52hmoe6SH7yTm
         GojWDomY8Im+qT81YBhUVLDIoiblWOxvbH645I7nFSeuaqxywrTLxgqWUsFSyQfcE2kE
         O4/A==
X-Gm-Message-State: AOJu0YwONdwlLCQ3cb+XRXiW40+y0HQYepEtCjzIluKl4/nfe8/g5Put
	buxrsbHPh4QImQR54M3loZ7Hpb6n62yHBpiqCPmPasRczKaDg5hU+wD++sxVOvZzamNqbpA5nsd
	3/wLTwV9/0E/8jDW8+KHVqVyIU2lK5e4tezw/fJ52grmJKRab3w==
X-Received: by 2002:a05:6512:1388:b0:507:cb04:59d4 with SMTP id fc8-20020a056512138800b00507cb0459d4mr4064366lfb.8.1699847216144;
        Sun, 12 Nov 2023 19:46:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF1sVWjx89wLzjv8uzIbm2a64hwQTFVaPA5NEPDKgxKvTgTBehD5jD8Q965wVGinSq3vS1YVPO2eKLhm30hVLk=
X-Received: by 2002:a05:6512:1388:b0:507:cb04:59d4 with SMTP id
 fc8-20020a056512138800b00507cb0459d4mr4064358lfb.8.1699847215776; Sun, 12 Nov
 2023 19:46:55 -0800 (PST)
MIME-Version: 1.0
References: <PH0PR12MB5481085F6E84FD2786FCD60BDCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <705607e3-39c3-47da-a688-80bbee31c48d@intel.com> <PH0PR12MB54814F9EEDD69ED434BF7994DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b0506d9f-37de-43c9-b99d-b00bb88c0d36@intel.com> <PH0PR12MB548174AF58B6ADDDA215123DDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <b8d51cd3-33fe-4167-a87b-ae662609c5d8@intel.com> <PH0PR12MB5481BCA941D86E1031D7A5D9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <7a0e7cef-434c-4049-b72f-b8188ecedbaf@intel.com> <20231108124402-mutt-send-email-mst@kernel.org>
 <b3ac6cd9-a04e-4cf4-9fce-a9d687191522@intel.com> <20231109050151-mutt-send-email-mst@kernel.org>
 <d477d03f-9c6c-4afe-ac1a-e3dc9e9d8fb4@intel.com> <PH0PR12MB5481647369D7DEB73989C14BDCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To: <PH0PR12MB5481647369D7DEB73989C14BDCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 13 Nov 2023 11:46:43 +0800
Message-ID: <CACGkMEvPk_HfEFBMR-w6zdNypeqBD+Rab++Cb9AZPx7WSP+C+Q@mail.gmail.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	"eperezma@redhat.com" <eperezma@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>, 
	"stefanha@redhat.com" <stefanha@redhat.com>, 
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement VIRTIO_F_QUEUE_STATE

On Fri, Nov 10, 2023 at 8:31=E2=80=AFPM Parav Pandit <parav@nvidia.com> wro=
te:
>
>
> > From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > Sent: Friday, November 10, 2023 12:23 PM
> >
> >
> > On 11/9/2023 6:02 PM, Michael S. Tsirkin wrote:
> > > On Thu, Nov 09, 2023 at 06:00:27PM +0800, Zhu, Lingshan wrote:
> > >>
> > >> On 11/9/2023 1:44 AM, Michael S. Tsirkin wrote:
> > >>> On Tue, Nov 07, 2023 at 05:31:38PM +0800, Zhu, Lingshan wrote:
> > >>>> On 11/6/2023 6:52 PM, Parav Pandit wrote:
> > >>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > >>>>>> Sent: Monday, November 6, 2023 2:57 PM
> > >>>>>>
> > >>>>>> On 11/6/2023 12:12 PM, Parav Pandit wrote:
> > >>>>>>>> From: Zhu, Lingshan <lingshan.zhu@intel.com>
> > >>>>>>>> Sent: Monday, November 6, 2023 9:01 AM
> > >>>>>>>>
> > >>>>>>>> On 11/3/2023 11:50 PM, Parav Pandit wrote:
> > >>>>>>>>>> From: virtio-comment@lists.oasis-open.org
> > >>>>>>>>>> <virtio-comment@lists.oasis- open.org> On Behalf Of Zhu,
> > >>>>>>>>>> Lingshan
> > >>>>>>>>>> Sent: Friday, November 3, 2023 8:27 PM
> > >>>>>>>>>>
> > >>>>>>>>>> On 11/3/2023 7:35 PM, Parav Pandit wrote:
> > >>>>>>>>>>>> From: Zhu Lingshan <lingshan.zhu@intel.com>
> > >>>>>>>>>>>> Sent: Friday, November 3, 2023 4:05 PM
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> This patch adds two new le16 fields to common configuratio=
n
> > >>>>>>>>>>>> structure to support VIRTIO_F_QUEUE_STATE in PCI transport
> > layer.
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> Signed-off-by: Zhu Lingshan <lingshan.zhu@intel.com>
> > >>>>>>>>>>>> ---
> > >>>>>>>>>>>>        transport-pci.tex | 18 ++++++++++++++++++
> > >>>>>>>>>>>>        1 file changed, 18 insertions(+)
> > >>>>>>>>>>>>
> > >>>>>>>>>>>> diff --git a/transport-pci.tex b/transport-pci.tex index
> > >>>>>>>>>>>> a5c6719..3161519 100644
> > >>>>>>>>>>>> --- a/transport-pci.tex
> > >>>>>>>>>>>> +++ b/transport-pci.tex
> > >>>>>>>>>>>> @@ -325,6 +325,10 @@ \subsubsection{Common configuration
> > >>>>>>>> structure
> > >>>>>>>>>>>> layout}\label{sec:Virtio Transport
> > >>>>>>>>>>>>                /* About the administration virtqueue. */
> > >>>>>>>>>>>>                le16 admin_queue_index;         /* read-onl=
y for driver
> > */
> > >>>>>>>>>>>>                le16 admin_queue_num;         /* read-only =
for driver
> > */
> > >>>>>>>>>>>> +
> > >>>>>>>>>>>> +        /* Virtqueue state */
> > >>>>>>>>>>>> +        le16 queue_avail_state;         /* read-write */
> > >>>>>>>>>>>> +        le16 queue_used_state;          /* read-write */
> > >>>>>>>>>>> This tiny interface for 128 virtio net queues through
> > >>>>>>>>>>> register read writes, does
> > >>>>>>>>>> not work effectively.
> > >>>>>>>>>>> There are inflight out of order descriptors for block also.
> > >>>>>>>>>>> Hence toy registers like this do not work.
> > >>>>>>>>>> Do you know there is a queue_select? Why this does not work?
> > >>>>>>>>>> Do you know how other queue related fields work?
> > >>>>>>>>> :)
> > >>>>>>>>> Yes. If you notice queue_reset related critical spec bug fix
> > >>>>>>>>> was done when it
> > >>>>>>>> was introduced so that live migration can _actually_ work.
> > >>>>>>>>> When queue_select is done for 128 queues serially, it take a
> > >>>>>>>>> lot of time to
> > >>>>>>>> read those slow register interface for this + inflight descrip=
tors +
> > more.
> > >>>>>>>> interesting, virtio work in this pattern for many years, right=
?
> > >>>>>>> All these years 400Gbps and 800Gbps virtio was not present,
> > >>>>>>> number of
> > >>>>>> queues were not in hw.
> > >>>>>> The registers are control path in config space, how 400G or 800G
> > affect??
> > >>>>> Because those are the one in practice requires large number of VQ=
s.
> > >>>>>
> > >>>>> You are asking per VQ register commands to modify things dynamica=
lly
> > via this one vq at a time, serializing all the operations.
> > >>>>> It does not scale well with high q count.
> > >>>> This is not dynamically, it only happens when SUSPEND and RESUME.
> > >>>> This is the same mechanism how virtio initialize a virtqueue,
> > >>>> working for many years.
> > >>> I wish we just had a transport vq already. That's the way to solve
> > >>> this not fighting individual bits.
> > >> Yeah, I agree, transport is a queued task(sent out V4 months ago...)=
,
> > >> one by one... hard and tough work...
> > > Frankly I think that should take precedence, then Parav will not get
> > > annoyed each time add a couple of registers.
> > I agree, things can happen and we are already here..
> Unfortunately transport vq is of not much help for below fundamental reas=
ons.
>
> 1.1 as it involves many VMEXITS of accessing runtime config spaced on slo=
w registers.
> 1.2 or alternatively hypervisor end up polling may thousands of registers=
 wasting cpu resources.
> 2. It does not help of future CC use case where hypervisor must not be in=
volved in dynamic config
> 3. Complex device like vnet has already stopped using every growing confi=
g space and using cvq, large part of work in 1.3 has shown that already
> 4. PFs also cannot infinitely grow registers, they also need less on-die =
registers.

You miss the point here. Nothing makes transport vq different from
what you proposed here (especially the device context part).

>
> And who knows the backward compatible SIOV devices may offer same bar as =
VFs.

Another self-contradictory, isn't it? You claim the bar is not
scalable, but you still want to offer a bar for SIOV?

>
> virto spec has already outlined this efficient concept in the spec and TC=
 members are already following it.

Another shifting concept. Admin commands/virtqueues makes sense
doesn't mean you can simply layer everything on top.

What's more, Spec can't be 100% correct, that's why there are fixes or
even revert.

>
> SIOV for non-backward compatible mode, anyway, need new interface and vq =
is inherently already there which fulfilling the needs.

What interface did you mean here? How much does it differ from the
transport virtqueue?

Again, if you keep raising unrelated topics like CC or TDISP, the
discussion won't converge. And you are self-contradicting that you
still haven't explained why your proposal can work in those cases.

Thanks



>
> > >
> > >>>>>> See the virtio common cfg, you will find the max number of vqs i=
s
> > >>>>>> there, num_queues.
> > >>>>> :)
> > >>>>> Sure. those values at high q count affects.
> > >>>> the driver need to initialize them anyway.
> > >>>>>>> Device didn=E2=80=99t support LM.
> > >>>>>>> Many limitations existed all these years and TC is improving an=
d
> > >>>>>>> expanding
> > >>>>>> them.
> > >>>>>>> So all these years do not matter.
> > >>>>>> Not sure what are you talking about, haven't we initialize the
> > >>>>>> device and vqs in config space for years?????? What's wrong with=
 this
> > mechanism?
> > >>>>>> Are you questioning virito-pci fundamentals???
> > >>>>> Don=E2=80=99t point to in-efficient past to establish similar in-=
efficient future.
> > >>>> interesting, you know this is a one-time thing, right?
> > >>>> and you are aware of this has been there for years.
> > >>>>>>>>>> Like how to set a queue size and enable it?
> > >>>>>>>>> Those are meant to be used before DRIVER_OK stage as they are
> > >>>>>>>>> init time
> > >>>>>>>> registers.
> > >>>>>>>>> Not to keep abusing them..
> > >>>>>>>> don't you need to set queue_size at the destination side?
> > >>>>>>> No.
> > >>>>>>> But the src/dst does not matter.
> > >>>>>>> Queue_size to be set before DRIVER_OK like rest of the
> > >>>>>>> registers, as all
> > >>>>>> queues must be created before the driver_ok phase.
> > >>>>>>> Queue_reset was last moment exception.
> > >>>>>> create a queue? Nvidia specific?
> > >>>>>>
> > >>>>> Huh. No.
> > >>>>> Do git log and realize what happened with queue_reset.
> > >>>> You didn't answer the question, does the spec even has defined
> > >>>> "create a vq"?
> > >>>>>> For standard virtio, you need to read the number of enabled vqs
> > >>>>>> at the source side, then enable them at the dst, so queue_size m=
atters,
> > not to create.
> > >>>>> All that happens in the pre-copy phase.
> > >>>> Yes and how your answer related to this discussion?
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

