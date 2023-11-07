Return-Path: <virtio-comment-return-8220-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3C91C4167B
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 07:22:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0A5013358D
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 07:22:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id DA12D9867FF
	for <virtio-comment@archiver.kernel.org>; Tue,  7 Nov 2023 07:22:43 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id B72969867E6; Tue,  7 Nov 2023 07:22:43 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A85B29867E7
	for <virtio-comment@lists.oasis-open.org>; Tue,  7 Nov 2023 07:22:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: EZhqad8zNNuzg1fUe4_Kpg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699341760; x=1699946560;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UrC8ACn5ul2x2VS5LbaBTjkbaMbpMxxOVOby56vO+nE=;
        b=Q96QUnHItnk1H9qVifItNkP0weJTNvq5PyvBEq4Cc8lh5fymHXKYGCSN1sh8VNlnvt
         cHIv2Xl/TXc5YzSNYSrrWEGFwbfhnXOs2OPezi7VNNuItA5Plj2/FnEeUJSbRMkRn7ZG
         uWhJeo71lFcyXIVFLYyCOG18Zi08DEbnjAMjr/AEiDVHG4rvND9tIde1Gcwjqq4FbDDO
         RhON9/ucGVmnF1+g/KSjLNxevYz0iKLp56OObbgO7uD8xiZQ/6bxxatlUhSsM8WU8wlb
         vNmzSc92nTm0+LcpO4sMr+sUx0xqik73ZhDzH9d44JEXTRn2fiWuqY2Zuu4Oxz6KSEfT
         7ETA==
X-Gm-Message-State: AOJu0Yw/GF1B4mfP8SrKp0afxBmn0txnLO7RwNk4Xd2tpVapQ4l4mWJR
	yvGA/B5De338xyqAjnXvbmcW6oON4eDTargcWwajJQcAuPbLCTfIqWzaOH0EACHLoE74WMPjFkH
	1ZegxO4YKABsd3lTOkb1RJow0PuTegTneqg==
X-Received: by 2002:a05:600c:3144:b0:408:4266:12db with SMTP id h4-20020a05600c314400b00408426612dbmr1759070wmo.13.1699341760570;
        Mon, 06 Nov 2023 23:22:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGOGVNzEcpDclJq0764mXGoNXtAy/2L5kzLCFAIizKKdGypnB2WDRXZ5kmTInmsM+NR1QqVDA==
X-Received: by 2002:a05:600c:3144:b0:408:4266:12db with SMTP id h4-20020a05600c314400b00408426612dbmr1759050wmo.13.1699341760117;
        Mon, 06 Nov 2023 23:22:40 -0800 (PST)
Date: Tue, 7 Nov 2023 02:22:35 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231107021917-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548175CD39FA20BE2727E5B6DCA1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEuJySOAGguGvnBA7ftD0mwwM_M0SO0266M1+7d+XRXQ=g@mail.gmail.com>
 <PH0PR12MB5481ABD71DAF7D82931D57D2DCA0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu0gfw4zNc9KTLm9ekhuWgsgzHLVya_68HajQZObtr3-w@mail.gmail.com>
 <DM8PR12MB54808B71AA9C0A945D0A3226DCA7A@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Tue, Nov 07, 2023 at 12:05:12PM +0800, Jason Wang wrote:
> > > > > One thing that you ignore is that, hypervisor can use what you
> > > > > invented as a transport for VF, no?
> > > > >
> > > > No. by design,
> > >
> > > It works like hypervisor traps the virito config and forwards it to admin
> > > virtqueue and starts the device via device context.
> > It needs more granular support than the management framework of device context.
> 
> It doesn't otherwise it is a design defect as you can't recover the
> device context in the destination.
> 
> Let me give you an example:
> 
> 1) in the case of live migration, dst receive migration byte flows and
> convert them into device context
> 2) in the case of transporting, hypervisor traps virtio config and
> convert them into the device context
> 
> I don't see anything different in this case. Or can you give me an example?

"trap virtio config" means "trap writes into virtio config" presumably?
config can change itself without driver doing anything. Hypervisor
can't trap it then. This is one of the problems with Lingshan's
SUSPEND bit - what happens with these config changes in underspecified.

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

