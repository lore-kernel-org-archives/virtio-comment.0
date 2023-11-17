Return-Path: <virtio-comment-return-8478-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B095C072A2
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 15:09:50 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B18ED613D1
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 15:09:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 80FA7986E31
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 15:09:49 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 63F78986E25; Fri, 17 Nov 2023 15:09:49 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 54CD0986E26
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 15:09:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: NntpfTubOqi1sOqyJsb6Mw-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700233782; x=1700838582;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sknzxl0iXMWmWNO/pnL8+I0TsRq2QwiA4GTmsiCufaM=;
        b=Xx1m7T+3iIFyuaRhysR15fQk5Z2dB7QT2iU5iGFPOvlAQuiEzwjdCoqBp0f8EGvUNf
         9b6yaTWb15LA5Nv28yiWfXg2QDCkUayUDn6cIbq2qcGDEj59kHcWNXHV2ODYxOLjyJf1
         WvMBeX7kuKIn+s+8IKp0kxl2WWqCDcm6jhWjshZ62hbH62bJdP2rPlMlsUtkH0RxWsNj
         BQLy2sZuW1agj0ctXK3Gf6baj6sYWl/UKSzstnsmra5jBPMMFlSmsgtAqYOyns8ukRcT
         SINfXZr6gxbYBBcS8csqsgippFpbBXvPmRKwCq1EqFC7aCU1NtuliKTsfm4zLVOUAj8Q
         kkYg==
X-Gm-Message-State: AOJu0YwwyXP7pelTUnbzFFzav1jcpdFFdhZINH27SsGG0Ub0cZKLfHO9
	6n/qEOnbL3jFCefDC16j+ffyEEuBd0WqNRc9nCAqv9pn3miSozS464zXCDXm8UPIn8EH/153j/F
	G8wtilAwFVAz93+bBtvocPMX+fWiZfB9RCA==
X-Received: by 2002:a05:6000:18a1:b0:32f:9977:ef03 with SMTP id b1-20020a05600018a100b0032f9977ef03mr16134657wri.18.1700233782061;
        Fri, 17 Nov 2023 07:09:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFYYC2dEmuNpSUInLaTs578UMlS1WRCmbaVLnBoO03E175wuawx/0caix6xUkRQNu9RmkPCYw==
X-Received: by 2002:a05:6000:18a1:b0:32f:9977:ef03 with SMTP id b1-20020a05600018a100b0032f9977ef03mr16134631wri.18.1700233781576;
        Fri, 17 Nov 2023 07:09:41 -0800 (PST)
Date: Fri, 17 Nov 2023 10:09:37 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231117100118-mutt-send-email-mst@kernel.org>
References: <20231117050357-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54810D15E0897C2435697E39DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117060456-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AB5ECF613D806C338C54DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117063406-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481089119BAB97C8F4B7CE0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117070636-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B61EF6DE47F2625D0670DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117084325-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54817B9406C8B0B5386E583DDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54817B9406C8B0B5386E583DDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Fri, Nov 17, 2023 at 02:51:04PM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 7:24 PM
> > 
> > On Fri, Nov 17, 2023 at 12:46:21PM +0000, Parav Pandit wrote:
> > >
> > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > Sent: Friday, November 17, 2023 6:00 PM
> > > > To: Parav Pandit <parav@nvidia.com>
> > > >
> > > > On Fri, Nov 17, 2023 at 12:02:49PM +0000, Parav Pandit wrote:
> > > > >
> > > > >
> > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > Sent: Friday, November 17, 2023 5:13 PM
> > > > > >
> > > > > > On Fri, Nov 17, 2023 at 11:20:14AM +0000, Parav Pandit wrote:
> > > > > > >
> > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > Sent: Friday, November 17, 2023 4:41 PM
> > > > > > > >
> > > > > > > > On Fri, Nov 17, 2023 at 10:20:45AM +0000, Parav Pandit wrote:
> > > > > > > > >
> > > > > > > > >
> > > > > > > > > > From: Michael S. Tsirkin <mst@redhat.com>
> > > > > > > > > > Sent: Friday, November 17, 2023 3:38 PM
> > > > > > > > > >
> > > > > > > > > > On Wed, Nov 15, 2023 at 05:39:43PM +0000, Parav Pandit wrote:
> > > > > > > > > > > > >
> > > > > > > > > > > > > Additionally, if hypervisor has put the trap on
> > > > > > > > > > > > > virtio config, and because the memory device
> > > > > > > > > > > > > already has the interface for virtio config,
> > > > > > > > > > > > >
> > > > > > > > > > > > > Hypervisor can directly write/read from the
> > > > > > > > > > > > > virtual config to the member's
> > > > > > > > > > > > config space, without going through the device context, right?
> > > > > > > > > > > >
> > > > > > > > > > > > If it can do it or it can choose to not. I don't see
> > > > > > > > > > > > how it is related to the discussion here.
> > > > > > > > > > > >
> > > > > > > > > > > It is. I don’t see a point of hypervisor not using the
> > > > > > > > > > > native interface provided
> > > > > > > > > > by the member device.
> > > > > > > > > >
> > > > > > > > > > So for example, it seems reasonable to a member
> > > > > > > > > > supporting both existing pci register interface for
> > > > > > > > > > compatibility and the future DMA based one for scale. In
> > > > > > > > > > such a case, it seems possible that DMA will expose more
> > > > > > > > > > features than pci. And then a hypervisor might decide to
> > > > > > > > > > use
> > > > > > > > that in preference to pci registers.
> > > > > > > > >
> > > > > > > > > We don’t find it right to involve owner device for
> > > > > > > > > mediating at current scale
> > > > > > > >
> > > > > > > > In this model, device will be its own owner. Should not be a problem.
> > > > > > > >
> > > > > > > I didn’t understand above comment.
> > > > > >
> > > > > > We'd add a new group type "self". You can then send admin
> > > > > > commands through VF itself not through PF.
> > > > > >
> > > > > How? The device is owned by the guest. FLR and device reset cannot
> > > > > send the
> > > > admin command reliably.
> > > >
> > > > It's of the "it hurts when I do this - don't do this then" category.
> > > >
> > > it is don’t do medication category, yes due all this weirdness that has been
> > asked.
> > >
> > > >
> > > > > >
> > > > > > > > > and to not break TDISP efforts in upcoming time by such design.
> > > > > > > >
> > > > > > > > Look you either stop mentioning TDISP as motivation or
> > > > > > > > actually try to address it. Safe migration with TDISP is really hard.
> > > > > > > But that is not an excuse to say that TDISP migration is not
> > > > > > > present, hence
> > > > > > involve the owner device for config space access.
> > > > > > > This is another hurdle added that further blocks us away from TDISP.
> > > > > > > Hence, we don’t want to take the route of involving owner
> > > > > > > device for any
> > > > > > config access.
> > > > > >
> > > > > > This "blocks" is all just wild hunches. hypervisor controls some
> > > > > > aspects of TDISP devices for sure - maybe we actually should use
> > > > > > pci config space as that is generally hypervisor controlled.
> > > > > Even bad to do hypercalls.
> > > > > I showed you last time the role of the PCI config space snippet from the
> > spec.
> > > >
> > > > Yes I remember. This is just an example though. My point is maybe it
> > > > is solvable maybe it is not.
> > > >
> > > > > Do you see we are repeating the discussion again?
> > > >
> > > > One of the reasons is that people bring up irrelevances. TDISP is
> > > > important but has to be addressed or deferred not vaguely referred to.
> > >
> > > So lets continue to follow the current TDISP direction of not involving
> > hypervisor for virtio common and device config.
> 
> If you disagree to it, please speak now, so that we don’t debate on this again in next 3 days.
> Because this is the fundamental design considerations it relied on.
> There is no point going forward if you want to disagree to it.
> Other variants are fine, but other variants cannot be the only choice.
> 
> > >
> > > >
> > > > > >
> > > > > > > > For example, your current patches are clearly broken for TDISP:
> > > > > > > > owner can control queue state at any time making device
> > > > > > > > modify memory in any way it wants.
> > > > > > > >
> > > > > > > When TDISP migration is needed, the admin device can be
> > > > > > > another TVM
> > > > > > outside the HV scope.
> > > > > > > Or an alternative would have device context encrypted not
> > > > > > > visible to HV at
> > > > all.
> > > > > >
> > > > > > Maybe. Fact remains your patches do conflict with TDISP and you
> > > > > > seem to be fine with it because you have a hunch you can fix it.
> > > > > > But we can't do development based on your hunches.
> > > > > >
> > > > > We have different view.
> > > > > My patches do not conflict with TDISP because TDISP has clear
> > > > > definition of
> > > > not involving hypervisor for transport.
> > > > > And that part is still preserved.
> > > > > Delegating the migration to another TDISP or encrypting is yet to be
> > defined.
> > > > > And current patches will align to both the approaches in future.
> > > > >
> > > > > So you need to re-evaluate your judgment.
> > > >
> > > > If you like they do not "conflict".  But if used with TDISP they
> > > > just make it insecure and thus completely worthless.  If hypervisor
> > > > can change ring state to make device poke at random guest memory
> > > > then it is game over and all the effort spent was security theater.
> > > Not really, I proposed two options.
> > > 1. delegate the task of LM to the TVM. (proposed by two cpu vendors).
> > > In this case all the infra we build here, just works fine.
> > 
> > I think modification will be needed: currently commands are sent through the
> > PF, and that is under hypervisor control.
> > You should not assign PF to TVM.
> Yes, an admin virtio function will be there which will do the admin commands listed.

So it can't be PF, so at least we need a new group type.
I am inclined to then say, operate it through VF itself.


> > 
> > > It also does not require any hypervisor mediation for control plane.
> > >
> > > 2. Encrypt the owner device workload to be not seen by hypervisor
> > >
> > > Both methods does not affect the current direction.
> > >
> > > But if we force trap+emulation, it is 100% broken for TDISP.
> > > And I would not promote that.
> > >
> > > > But you know this, don't you? This is why you mentioned encrypting device.
> > > > Maybe that works. It just does not work *as is*.
> > > It works as_is. But current infrastructure does not block the future work.
> > >
> > > >
> > > >
> > > > > >
> > > > > > > Such encryption is not possible, with the trap+emulation
> > > > > > > method, where HV
> > > > > > will have to decrypt the data coming over MMIO writes.
> > > > > >
> > > > > > I don't how what trap+emulation has to do with it. Do you refer
> > > > > > to the shadow vq thing?
> > > > >
> > > > > The method proposed here does not hinder any TDISP direction.
> > > >
> > > > direction? No, why would it. we can always add more commands that
> > > > are safe for TDISP. commands you propose here are unsafe for TDISP.
> > > >
> > > > > Without my proposal, do you have a method that does not involve
> > > > > hypervisor
> > > > intervention for virtio common and device config space, cvq and shadow
> > vq?
> > > > > If so, I would like to hear that as well because that will align with TDISP.
> > > >
> > > > I really did not give it much thought.  I suspect for TDISP it just
> > > > might be cleaner to have guest agent migrate device. Certainly removes all
> > the messy questions.
> > > > That, to me impliest there needs to be a way to send migration
> > > > commands through VF itself. Does this "involve hypervisor
> > > > intervention"? No one should care I think.
> > > Too far of the future to envision. May be yes. When such platform is
> > > built, for sure whoever migrates need migrate its device side too.
> > > Some knowledge of migration driver is needed.
> > 
> > So TDISP migration is so far in the future you do not need to bother about it.
> > Fine. Then don't bring it up pls.
> > 
> As long as we are aligned to the requirement that a virtio member device is mapped to the guest VM without mediating the virtio interface, I am good.
> Again, other variants are fine, but above listed mapped variant is the minimum variant needed.

I think it's worth supporting this. I wouldn't call this minimum there
are other approaches. And I am not so sure it's worth trying
to support this in all kind of systems such as IOMMU without
dirty bit support. If some old systems will need mediation,
this is kind of like legacy interface. Not a big deal.



> > > >
> > > >
> > > > > > I am guessing modern platforms with TDISP support are likely to
> > > > > > also support dirty bit in the IOMMU.
> > > > > >
> > > > > It will be some day.
> > > >
> > > > What does this mean? Which platforms support TDISP and which IOMMUs
> > > > do they use?
> > > I said it will be some day, not right now.
> > 
> > That would be a stupid decision by a platform vendor. Let's just hope they don't
> > do it.
> > 
> > > >
> > > > > >
> > > > > > > > > And for future scale, having new SIOV interface makes more
> > > > > > > > > sense which has
> > > > > > > > its own direct interface to device.
> > > > > > > > >
> > > > > > > > > I finally captured all past discussions in form of a FAQ at [1].
> > > > > > > > >
> > > > > > > > > [1]
> > > > > > > > > https://docs.google.com/document/d/1Iyn-l3Nm0yls3pZaul4lZi
> > > > > > > > > Vj8x
> > > > > > > > > 1s73
> > > > > > > > > Ed6r
> > > > > > > > > Osmn6LfXc/edit?usp=sharing
> > > > > > > >
> > > > > > > > Yea skimmed that, "Cons: None". Are you 100% sure? Anyway,
> > > > > > > > discussion will take place on the mailing list please.
> > > > > > >
> > > > > > > We cannot keep discussing the register interface every week.
> > > > > > > I remember we have discussed this many times already in following
> > series.
> > > > > > >
> > > > > > > 1. legacy series
> > > > > > > 2. tvq v4 series
> > > > > > > 3. dynamic vq creation series
> > > > > > > 4. again during suspend series under tvq head 5. right now 6.
> > > > > > > May be more that I forgot.
> > > > > > >
> > > > > > > I captured all the direction and options in the doc. One can
> > > > > > > refer when those
> > > > > > questions arise there.
> > > > > > > If we don’t work cohesively same reasoning repetition does not help.
> > > > > >
> > > > > > It's still the same too, doc or no doc. You want to build a
> > > > > > device without registers fine but don't force it down everyone's throat.
> > > > > I don’t see any compelling reason for inventing new method really.
> > > > > Nor continuing in register mode.
> > > > > Virtio already has VQ.
> > > > > If CVQ is so problematic, one should put everything on registers
> > > > > and not run
> > > > on double standards.
> > > >
> > > > We should not and neither should we put everything behind a VQ.
> > > >
> > > Why?
> > 
> > Because simple things should be simple, complex things should be possible.
> CVQ != complex.
> And if it is, all things placed on the CVQ must be moved to registers first.

It is more complex than a register.

> > 
> > > >
> > > > > I captured all the reasoning and thoughts. I don’t have much to
> > > > > say in support
> > > > of infinite register scale.
> > > > >
> > > > > People who wants to push SIOV does not show single performance
> > > > > reason on
> > > > why SIOV to be done.
> > > > > I have upstreamed SIOVs in Linux as SFs without PASID, and in all
> > > > > our scale
> > > > tests, before the device chocks, the system chocks.
> > > > >
> > > > > So when someone pushes the SIOV series, I will be the first one
> > > > > interested in
> > > > reading the performance numbers to proceed with patches.
> > > > >
> > > > > > And now with 8MBytes
> > > > > > of on-device memory that's needed for migration and that's
> > > > > > apparently fine I am even less interested in saving 256 bytes
> > > > > > for config
> > > > space.
> > > > >
> > > > > Again, not the right comparison. When and how to use 256 matters.
> > > > > I haven’t come across any device that prefers infinite register scale.
> > > >
> > > > Why resort to hyperbole? 256 bytes is pretty far from infinite.  But
> > > > again, if you don't want it in registers just add an option to move
> > > > *all* of config space out of registers.
> > > This does not work in backward compatible way, not brings the predictability.
> > 
> > It will work if we want it to.
> > 
> > > The proposed method and current direction is just fine. No changes needed.
> > 
> > So one of the things that for example I care about is cross-vendor compatibility.
> > And if that compatibility is expressed through config space then that is a single
> > consistent interface.
> It just does not make sense to be expressed as config space by burning more registers.
>
>
> There is already command in v4 that shows the member function capabilities.
> 
> > How do you provision? Supply config space context.
> > This is what I am looking for, a single place where init time values can be
> > mapped, and for all device type. CVQ is not that.
> Provision the device for the resources using admin command and query capabilities via admin command.
> 
> No need to place once in lifetime structure in such registers.
> This is not simplicity.
> 
> > 
> > 
> > > No one is extending the config space or config registers in virtio anymore
> > anyway.
> > 
> > Then you tell me.  How much on-device memory per VF is fine?
> As I listed in the document, few bytes to boot strap the device.
> I anticipate less than 64B is really enough.
> 
> > If the answer is "as little as possible" then we can do better than the current pci
> > transport. If the answer is "a couple 100 bytes is not a problem, as long as it's
> > only be init time stuff" then that is exactly what we always had.
> Right. So let's not add giant cross vendor capabilities there. It is surely going to cross 100 bytes.
> 
> > 
> > > > cheaper devices will require newer guests.
> > > > Or, 10 years will pass and you will be able to drop compat with old
> > > > guests. I know it's too long a game for you to care but I've been
> > > > virtio spec editor for more than 10 years so to me it seems reasonable to
> > plan like that.
> > >
> > > Current proposal of using CVQ is just working fine across most* virtio spec
> > contributors.
> > > I don’t see technical reason to change it.
> > 
> > We have flamewars re-erupting all the time. What I want us to do is to draw a
> > line in the sand what is and what is not reasonable in config space. It has to
> > have a model behind it too that a reasonable developer can understand.
> This is why I wrote all the points and trade off in the document.
> 
> The current model defined in virtio spec Appendix B B.2 is really good enough and practical.

It says:
	Device configuration space should only be used for initialization-time
	parameters.

So for example, you want to know whether device supports offloads
during driver init, thus offloads are fine as config space or
feature bits. Makes sense? As another example, you need to know
# of admin vqs during init time so again, config.


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

