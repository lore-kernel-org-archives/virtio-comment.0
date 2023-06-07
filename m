Return-Path: <virtio-comment-return-6208-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEE9EC7EE23
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:54:14 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id DA35B10BD
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:54:11 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id CEBA4986656
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 08:54:11 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C501C98664C; Wed,  7 Jun 2023 08:54:11 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id B186898664F
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 08:54:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: LZzp3dTXOdi8P6RiFlCyAg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686128045; x=1688720045;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mc5+jcBo5QHTAr/wig1xQu7FvVMd3URiYk8kDGkK1VY=;
        b=gJhhC3uq8o1ghtSRiuJSCxecypEOYzHP+N9QfCG3BYYik25AxwdXchlKO//JposVXK
         4KivWaHxMn2Eqk3Wjok91ZIR9Qu7jF94mkAmiQ//F5NUzjrbIICGiwwCOadPC2bSsP1f
         zKK3/UskS9C6GWWIQOHc+47VZ+pCHaAHb7fpyzNtd4o3uKWBERolnDKz1rlzIsEHIjss
         ugdq4RywkTlONrELifz5tvAbx8ChDHxJlG163L36aTLBD4Tw+neUL4xFc0hdjlVJJRoC
         qKxyGrcPDf22OaS87ya0C/ZID29U39jUOwpZZB3xfodGcrPga6I5DW1V26E+t6Z/BPEZ
         8QWg==
X-Gm-Message-State: AC+VfDwdLnNyrdd0U1uze53zfxbX+ID3Vr9M8me2ul0oq5VvWivyiq6F
	RFBAuKyuGYUWgSR/E8n64asHzxyQXkuQWq1Kcr0cPsSg5aGHp1E+CXLbBXZ3EWm92DDJKQbxodo
	s7nksfng4T/94uKSqVcnWpSHxuwbRposfNA==
X-Received: by 2002:adf:df04:0:b0:30a:a715:66c8 with SMTP id y4-20020adfdf04000000b0030aa71566c8mr4018777wrl.8.1686128045502;
        Wed, 07 Jun 2023 01:54:05 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5sOlmVWEcM5SCoi1qlMfc6sNj2HHTIjxp6vEuCdY05ZCLUHBzfxoiCpHwsSwTch/zgJWH4EA==
X-Received: by 2002:adf:df04:0:b0:30a:a715:66c8 with SMTP id y4-20020adfdf04000000b0030aa71566c8mr4018756wrl.8.1686128045145;
        Wed, 07 Jun 2023 01:54:05 -0700 (PDT)
Date: Wed, 7 Jun 2023 04:54:00 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230607045225-mutt-send-email-mst@kernel.org>
References: <20230605014539-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C14D65D5E10CD23A9F67DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605092859-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481CEB3A34AAB49A282F2A8DC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230605174755-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548180E16376862A3C0DFF1DDC4DA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606073544-mutt-send-email-mst@kernel.org>
 <CACGkMEv1so_KGwJZG3GnAf=JNky7+BMNK7N4NTtucDS+WyW5VA@mail.gmail.com>
 <PH0PR12MB5481D80A48F3BD82D86B3DB0DC53A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsVrqCGJJ2Q5OGbgPdtEJHTpvVt6nEKP_MzkSH_-cOa6w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsVrqCGJJ2Q5OGbgPdtEJHTpvVt6nEKP_MzkSH_-cOa6w@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Subject: [virtio-comment] Re: [virtio-dev] Re: [PATCH v3 0/3] transport-pci: Introduce legacy
 registers access using AQ

On Wed, Jun 07, 2023 at 02:54:22PM +0800, Jason Wang wrote:
> On Wed, Jun 7, 2023 at 11:06 AM Parav Pandit <parav@nvidia.com> wrote:
> >
> >
> >
> > > From: Jason Wang <jasowang@redhat.com>
> > > Sent: Tuesday, June 6, 2023 10:27 PM
> > >
> > > I can't say I like this. I prefer to do meditation on top of a modern device with
> > > some lightweight features like _F_LEAGCY_HEADER. I don't see any advantages
> > > of a new legacy ABI over _F_LEGACY_HEADER. I don't want to repeat but I don't
> > > get any response here
> > >
> > It is net only and not generic. Not a big blocker.
> > It doesnt stop at _F_LEAGCY_HEADER.
> >
> > > Anything that prevents you from adding things like VIRTIO_NET_F_LEGACY_HEADER?
> > It requires hypervisor to mediate 1.x config region and intercept feature negotiation including q config and more.
> 
> For config region, do you mean device configuration space or common
> config space?
> 
> I don't see why we need to do mediation on neiter of the above.
> Hypervisor just need to prepare
> 
> 1) legacy BAR with legacy config and device configuration space and
> 2) modern BAR with modern capabilities (common cfg and device cfg)
> 
> For 2) it could be mapped directly to the modern capabilities. For 1)
> hypervisor needs to mediate
> 
> >
> > Additionally, 1.x device says the mac address is read only, while legacy is RW.
> > And that requires yet another feature bit negotiation.
> 
> Hypervisor can trap the legacy device configuration space write and
> convert it to cvq commands.
> 
> Thanks

Hypervisor really can't access cvq if guest is doing it too -
that requires emulating cvq in software. And *that* is going
to be broken for workloads such as confidential computing.

> >
> > The main design goal is to not mediate 1.x specific region and not modify 1.x region definitions.
> > Which is why we step forward with the AQ.
> >
> > > https://lore.kernel.org/virtio-
> > > dev/CACGkMEuixsBibSq_pEQvcKOH0WBQWnta4Q2c28SV8qTS8gaVcA@mail.g
> > > mail.com/#t


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

