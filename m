Return-Path: <virtio-comment-return-8465-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E827C197A0
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:40:43 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 684997216F
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:40:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 576EE986E2E
	for <virtio-comment@archiver.kernel.org>; Fri, 17 Nov 2023 12:40:42 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 4D26C986E21; Fri, 17 Nov 2023 12:40:42 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3FC15986E22
	for <virtio-comment@lists.oasis-open.org>; Fri, 17 Nov 2023 12:40:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: js2J8_iNNpyr_clYLRE3CA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700224838; x=1700829638;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nWqvCgrFXOPYzLi+SuuTy9/xSGfnGshDQYYF5HKsj8I=;
        b=jkyg/12gw1zxKCY500A/WVJv7svA3HvAG+bkfHuygNyMT4YOF1tAhjrk1KBKDpzj0F
         5A3FrUnNsdkUydE8tQSISK/pQC829T1JSLJNWNJhpBmNGjk58tGMe6mCuYpOhSqyhp+6
         NDLgg6DTbig+Xd9E5m2aJ91c6/iSs4zJQFwy+COyz2zGIutDVXq6U4jV0bVMDgWyp206
         cCWKhGAT4nPFrAHeSo0+gBzZjh1vNvYP87uSbiYLipslP82kDQNFqjZnKrh4adjBAZWE
         oTL3wKE/s9OLTG4hrsyZ222k1oJSJhavTt1qFOoyB4sbwCklMHZZml4CrT3pqMokHMAI
         UXmw==
X-Gm-Message-State: AOJu0Yx9/oedmx8ZcpuKlXipvWnWBuOZF+34rJu9MWejXC2YwvIYMwOt
	wlDpxpbyjfItD1e46Kw9afXaAXsjxFcdmyGEg+X8M4jw8AVdGoQk3bydRrM1hEbYDfcV+WU8owN
	nZhQqmt922PBRr3CWExrDUsrJMnjxTEZ+RA==
X-Received: by 2002:a2e:a7d6:0:b0:2c5:19e9:422c with SMTP id x22-20020a2ea7d6000000b002c519e9422cmr10335261ljp.24.1700224838672;
        Fri, 17 Nov 2023 04:40:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6fyVvm89kGH7J/3HnteY+xkvHgeiNiGDi3Ci5BNY6GtATkjW/pAGrhmisSsxfbiSy9DL6Sw==
X-Received: by 2002:a2e:a7d6:0:b0:2c5:19e9:422c with SMTP id x22-20020a2ea7d6000000b002c519e9422cmr10335243ljp.24.1700224838361;
        Fri, 17 Nov 2023 04:40:38 -0800 (PST)
Date: Fri, 17 Nov 2023 07:40:31 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231117073917-mutt-send-email-mst@kernel.org>
References: <20231117031251-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D7C85F006AE7292E1D82DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117042446-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813F2F62F87E42CD5DB4B0DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117044428-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481E8342B26739B852B592FDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117053117-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481632B9E440DDCBEEA7B75DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231117062003-mutt-send-email-mst@kernel.org>
 <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB548133582D377B3FE4BB9F6CDCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of
 operation for write recording commands

On Fri, Nov 17, 2023 at 12:22:59PM +0000, Parav Pandit wrote:
> 
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Friday, November 17, 2023 5:03 PM
> > To: Parav Pandit <parav@nvidia.com>
> 
> > > Somehow the claim of shadow vq is great without sharing any performance
> > numbers is what I don't agree with.
> > 
> > It's upstream in QEMU. Test it youself.
> > 
> We did few minutes back.
> It results in a call trace.
> Vhost_vdpa_setup_vq_irq crashes on list corruption on net-next.

Wrong list for this bug report.

> We are stopping any shadow vq tests on unstable stuff.

If you don't want to benchmark against alternatives how are you
going to prove your stuff is worth everyone's time?

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

