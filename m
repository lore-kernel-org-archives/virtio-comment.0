Return-Path: <virtio-comment-return-5173-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D13F7C76188
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 18:02:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0411D2AECE
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 18:02:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DD3089863F0
	for <virtio-comment@archiver.kernel.org>; Mon,  3 Apr 2023 18:02:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C6E709863E4; Mon,  3 Apr 2023 18:02:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B301F9863E5
	for <virtio-comment@lists.oasis-open.org>; Mon,  3 Apr 2023 18:02:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DHoLxBW2P6qIrEE63NXZdg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680544951;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XXnA+XhjI5YHqpSg3T6IBJ3M3uIHPGg2616D8CrCKmU=;
        b=TGLslRBoZM9cTMVYn5wS75/2MSD4lbPHQMmuHvi3/i2ZpQYHvOgYo1bWhs3+saYZvu
         6BU72pSVUF5SWDI98rziIJL9S1Uz0yktc0mqEPIYsHukU7Qd/mE6QrE/H8UBmtBkvOhd
         QoCVK2irpHO+bN5f0a7fDkuraK6+nQa2bIt1S/mqck7BT216Oe9aFdO65sSTc5ShdjjF
         Ma4EAIjsFSHIjLzEvlsbL8+zNtabRFDn5TrjMiVECftmNT/45OF6I1oiqGOHomtVVNVO
         IJ9psmakOs24XfcUH7rDIX4UEuI/4v5aITKlf+9FOxx3ne/5RBMZ16ktZWBh0LISIx8k
         i+7Q==
X-Gm-Message-State: AAQBX9d+8+G74v4o/g9hw3mOAVpcUqpGEr98iKkiO3110gWFyaQdv27e
	IgZdliE+uaLkwtBoWlcl0aE+hKA1VWtwZRS03jDvzpePaOl4M6wBoS4fIOfDGTdOWJMwqYgB0Tr
	oFBUO23wUVcfoETJRSW3LK4s7ajB1iaL1jA==
X-Received: by 2002:a17:906:a24f:b0:931:bc69:8f94 with SMTP id bi15-20020a170906a24f00b00931bc698f94mr36362485ejb.45.1680544951302;
        Mon, 03 Apr 2023 11:02:31 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZCmsS7QQTFUicAsdegONxDV9id2VoIK5TrDwqim/Dn6089xkdcETKi57CGVZAty/DKmrx8/g==
X-Received: by 2002:a17:906:a24f:b0:931:bc69:8f94 with SMTP id bi15-20020a170906a24f00b00931bc698f94mr36362462ejb.45.1680544950956;
        Mon, 03 Apr 2023 11:02:30 -0700 (PDT)
Date: Mon, 3 Apr 2023 14:02:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230403135446-mutt-send-email-mst@kernel.org>
References: <20230331024500-mutt-send-email-mst@kernel.org>
 <0dcd9907-4bb0-ef0d-678d-5bc8f0ded9ec@nvidia.com>
 <20230403105050-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D50080A3A7C5F81E3F62DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403110320-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481EC65708410304D9C1EA3DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403111735-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813E4193BC32775BDB2019DC929@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230403130950-mutt-send-email-mst@kernel.org>
 <24e5437e-d6bd-d65c-9ec2-699277a113a3@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <24e5437e-d6bd-d65c-9ec2-699277a113a3@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH 00/11] Introduce transitional mmr
 pci device

On Mon, Apr 03, 2023 at 01:29:32PM -0400, Parav Pandit wrote:
> 
> 
> On 4/3/2023 1:16 PM, Michael S. Tsirkin wrote:
> > On Mon, Apr 03, 2023 at 03:36:25PM +0000, Parav Pandit wrote:
> > > 
> > > 
> > > > From: virtio-comment@lists.oasis-open.org <virtio-comment@lists.oasis-
> > > > open.org> On Behalf Of Michael S. Tsirkin
> > > 
> > > > > Transport vq for legacy MMR purpose seems fine with its latency and DMA
> > > > overheads.
> > > > > Your question was about "scalability".
> > > > > After your latest response, I am unclear what "scalability" means.
> > > > > Do you mean saving the register space in the PCI device?
> > > > 
> > > > yes that's how you used scalability in the past.
> > > > 
> > > Ok. I am aligned.
> > > > > If yes, than, no for legacy guests for scalability it is not required, because the
> > > > legacy register is subset of 1.x.
> > > > 
> > > > Weird.  what does guest being legacy have to do with a wish to save registers
> > > > on the host hardware?
> > > Because legacy has subset of the registers of 1.x. So no new registers additional expected on legacy side.
> > > 
> > > > You don't have so many legacy guests as modern
> > > > guests? Why?
> > > > 
> > > This isn't true.
> > > 
> > > There is a trade-off, upto certain N, MMR based register access is fine.
> > > This is because 1.x is exposing super set of registers of legacy.
> > > Beyond a certain point device will have difficulty in doing MMR for legacy and 1.x.
> > > At that point, legacy over tvq can be better scale but with lot higher latency order of magnitude higher compare to MMR.
> > > If tvq being the only transport for these registers access, it would hurt at lower scale too, due the primary nature of non_register access.
> > > And scale is relative from device to device.
> > 
> > Wow! Why an order of magnitide?
> > 
> Because vqs involve DMA operations.
> It is left to the device implementation to do it, but a generic wisdom is
> not implement such slow work in the data path engines.
> So such register access vqs can/may be through firmware.
> Hence it can involve a lot higher latency.

Then that wisdom is wrong? tens of microseconds is not workable even for
ethtool operations, you are killing boot time.

I frankly don't know, if device vendors are going to interpret
"DMA" as "can take insane time" then maybe we need to scrap
the whole admin vq idea and make it all memory mapped like
Jason wanted, so as not to lead them into temptation?


> > > > > 
> > > > > > > > And presumably it can all be done in firmware ...
> > > > > > > > Is there actual hardware that can't implement transport vq but
> > > > > > > > is going to implement the mmr spec?
> > > > > > > > 
> > > > > > > Nvidia and Marvell DPUs implement MMR spec.
> > > > > > 
> > > > > > Hmm implement it in what sense exactly?
> > > > > > 
> > > > > Do not follow the question.
> > > > > The proposed series will be implemented as PCI SR-IOV devices using MMR
> > > > spec.
> > > > > 
> > > > > > > Transport VQ has very high latency and DMA overheads for 2 to 4
> > > > > > > bytes
> > > > > > read/write.
> > > > > > 
> > > > > > How many of these 2 byte accesses trigger from a typical guest?
> > > > > > 
> > > > > Mostly during the VM boot time. 20 to 40 registers read write access.
> > > > 
> > > > That is not a lot! How long does a DMA operation take then?
> > > > 
> > > > > > > And before discussing "why not that approach", lets finish
> > > > > > > reviewing "this
> > > > > > approach" first.
> > > > > > 
> > > > > > That's a weird way to put it. We don't want so many ways to do
> > > > > > legacy if we can help it.
> > > > > Sure, so lets finish the review of current proposal details.
> > > > > At the moment
> > > > > a. I don't see any visible gain of transport VQ other than device reset part I
> > > > explained.
> > > > 
> > > > For example, we do not need a new range of device IDs and existing drivers can
> > > > bind on the host.
> > > > 
> > > So, unlikely due to already discussed limitation of feature negotiation.
> > > Existing transitional driver would also look for an IOBAR being second limitation.
> > 
> > Some confusion here.
> Yes.
> > If you have a transitional driver you do not need a legacy device.
> > 
> IF I understood your thoughts split in two emails,
> 
> Your point was "we dont need new range of device IDs for transitional TVQ
> device because TVQ is new and its optional".
> 
> But this transitional TVQ device do not expose IOBAR expected by the
> existing transitional device, failing the driver load.
> 
> Your idea is not very clear.

Let me try again.

Modern host binds to modern interface. It can use the PF normally.
Legacy guest IOBAR accesses to VF are translated to transport vq
accesses.






> > 
> > 
> > > > > b. it can be a way with high latency, DMA overheads on the virtqueue for
> > > > read/writes for small access.
> > > > 
> > > > numbers?
> > > It depends on the implementation, but at minimum, writes and reads can pay order of magnitude higher in 10 msec range.
> > 
> > A single VQ roundtrip takes a minimum of 10 milliseconds? This is indeed
> > completely unworkable for transport vq. Points:
> > - even for memory mapped you have an access take 1 millisecond?
> >    Extremely slow. Why?
> > - Why is DMA 10x more expensive? I expect it to be 2x more expensive:
> >    Normal read goes cpu -> device -> cpu, DMA does cpu -> device -> memory -> device -> cpu
> > 
> > Reason I am asking is because it is important for transport vq to have
> > a workable design.
> > 
> > 
> > But let me guess. Is there a chance that you are talking about an
> > interrupt driven design? *That* is going to be slow though I don't think
> > 10msec, more like 10usec. But I expect transport vq to typically
> > work by (adaptive?) polling mostly avoiding interrupts.
> > 
> No. Interrupt latency is in usec range.
> The major latency contributors in msec range can arise from the device side.

So you are saying there are devices out there already with this MMR hack
baked in, and in hardware not firmware, so it works reasonably?

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

