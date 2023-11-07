Return-Path: <virtio-comment-return-8223-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB4DDC4332F
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:05:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 149CA60D33
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:05:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DE1B89867FE
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 08:05:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id C64F89867E8; Tue,  7 Nov 2023 08:05:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BBA8E9867EA
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 08:05:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: Hdmx52b3Ptytst6Uiw3Y5Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699344311; x=1699949111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u6t95Qag17M/YFz4xN8tPtid7yfQWmagZck/lyGlg/0=;
        b=TqIb57/4N/Z0iDMU2b6DbyWdNk+7XS/ZeX0HaZPh/EyPjPOPFEKaOEXdHGf0jaGF9p
         uFMaHo22xtez5jfGeu6UXx1AMdSD0bTCQEjRNV8hbWhvHOH1O/ylHMRmK+j/L1sleYz+
         7lUY/g6R+h4HGauj8rSdyiZjYasiBW1P0w1ZcY7s5yBfVsnFTFbZEcVIoEnyrOod0iRr
         ikmlneb5umvqhz4Wik3ptHIjs3BGvWP+Bijmgdfu4qeg722EV38XBu3PKt8jrXEDhxoz
         wlV5a21LvwpbRm0RUQSGhTgtT6rTmEFHeJ6/NA184gUtwAG0Kvf3PVcnkicqKEGa6kqY
         FLAA==
X-Gm-Message-State: AOJu0YztmVZ5duYTR6LIZRXUXKV69Wj2ZWMl8kTDyZyO0wTTkLZUnbBA
	mWaf12ttCLlQyk8u/64MoW67xuBzjVrxtlXdlPsZgJ66o5MQWmURt9Uf37opEhIcGNmw0VVamV1
	Cw0TFD1Ztx7inKDwl/Zu4yuQ15RB8zJl6xg==
X-Received: by 2002:a7b:c5d7:0:b0:408:37aa:774a with SMTP id n23-20020a7bc5d7000000b0040837aa774amr2121269wmk.17.1699344311562;
        Tue, 07 Nov 2023 00:05:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFyOO0XMNLbJY+PKId48vD/V64Bmimi2sU9OFiLQ8ArUGCd7iFkaiQl064CRhHdSgenNThNpw==
X-Received: by 2002:a7b:c5d7:0:b0:408:37aa:774a with SMTP id n23-20020a7bc5d7000000b0040837aa774amr2121241wmk.17.1699344311195;
        Tue, 07 Nov 2023 00:05:11 -0800 (PST)
Date: Tue, 7 Nov 2023 03:05:04 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Jason Wang <jasowang@redhat.com>, Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231107030205-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481ABD71DAF7D82931D57D2DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu0gfw4zNc9KTLm9ekhuWgsgzHLVya_68HajQZObtr3-w@mail.gmail.com>
 <DM8PR12MB54808B71AA9C0A945D0A3226DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <20231107021917-mutt-send-email-mst@kernel.org>
 <d22ca64a-8034-457a-b1ec-4afdc6726bfa@intel.com>
MIME-Version: 1.0
In-Reply-To: <d22ca64a-8034-457a-b1ec-4afdc6726bfa@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Tue, Nov 07, 2023 at 03:57:29PM +0800, Zhu, Lingshan wrote:
> 
> 
> On 11/7/2023 3:22 PM, Michael S. Tsirkin wrote:
> > On Tue, Nov 07, 2023 at 12:05:12PM +0800, Jason Wang wrote:
> > > > > > > One thing that you ignore is that, hypervisor can use what you
> > > > > > > invented as a transport for VF, no?
> > > > > > > 
> > > > > > No. by design,
> > > > > It works like hypervisor traps the virito config and forwards it to admin
> > > > > virtqueue and starts the device via device context.
> > > > It needs more granular support than the management framework of device context.
> > > It doesn't otherwise it is a design defect as you can't recover the
> > > device context in the destination.
> > > 
> > > Let me give you an example:
> > > 
> > > 1) in the case of live migration, dst receive migration byte flows and
> > > convert them into device context
> > > 2) in the case of transporting, hypervisor traps virtio config and
> > > convert them into the device context
> > > 
> > > I don't see anything different in this case. Or can you give me an example?
> > "trap virtio config" means "trap writes into virtio config" presumably?
> > config can change itself without driver doing anything. Hypervisor
> > can't trap it then. This is one of the problems with Lingshan's
> > SUSPEND bit - what happens with these config changes in underspecified.
> It should send a config interrupt and increase its generation.

/me shrugs

> By the way, is it buggy if a device suspend itself?
> Is needs_reset better even not properly handled by virito driver

NEEDS_RESET turned out not to be a great design.

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

