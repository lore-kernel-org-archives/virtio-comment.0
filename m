Return-Path: <virtio-comment-return-7984-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4933FC25B6B
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:26:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B1D4E2AD63
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:26:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 987BB986A58
	for <virtio-comment@archiver.kernel.org>; Thu, 26 Oct 2023 09:26:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 821BE986A4F; Thu, 26 Oct 2023 09:26:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 72642986A50
	for <virtio-comment@lists.oasis-open.org>; Thu, 26 Oct 2023 09:26:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: HXaHVyIUMJuTeXGoVPwVVQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698312389; x=1698917189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KcrllDnCNzaGLTNIlCkh1whjgbfYS7Todiul9fG7c0=;
        b=X9CZ0rmiPK4EL39WMeAfHXNytI6x03X4bsD4vvc3kQIfETRQksnukRVssNq4L2YfdY
         ZmyUa1wg9B21rtNoUzDVsvwn8/1+R5zSq5f/yEwNunj9BNKVvDxtn60r5cNoBaILE2mP
         KNzQ976LwC00KNLhFrW9vOXAnRI76+HeUeZV2K2tc4Yx5mCGPBZX8Ac74dtab4/hDblp
         uBg4OXXRLe+BkprgLkb3oT1SGtd213aAlIA99cR08TvSq5SkXqq2EehTM37mWola53Ee
         0KAuZfUVrqgKFXuFGJx7IVgUgQs//9uRABoX8VhRIUsno2y4glXaM5CkW20XQBwMz7rB
         HucQ==
X-Gm-Message-State: AOJu0YwZWAeWoin1s9JTOgAWjDUmRqvzQr2cV7LnZClfpwYkIKtXadUd
	hfbdBWXT5xWXXZCl982HNKcrSv9eYtFH0OabdJKLYHbMa2PEYTVjlUV9rHXQCz0u+IousOwZ5ZE
	6qNLbySwsToFsOGXxyhudjSwIFyKMvu375g==
X-Received: by 2002:a17:907:7293:b0:9ae:4878:1172 with SMTP id dt19-20020a170907729300b009ae48781172mr14022498ejc.7.1698312389345;
        Thu, 26 Oct 2023 02:26:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGbtPZtxbGsYwtsfP8TwYFcIY/JXgtTcHxj5wj6MJtoaMzRerpitvKQtF6Ng2OM6yju0dQY/w==
X-Received: by 2002:a17:907:7293:b0:9ae:4878:1172 with SMTP id dt19-20020a170907729300b009ae48781172mr14022475ejc.7.1698312388963;
        Thu, 26 Oct 2023 02:26:28 -0700 (PDT)
Date: Thu, 26 Oct 2023 05:26:24 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Eugenio Perez Martin <eperezma@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
	"xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20231026052317-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB5481723C85AF5B80689C9084DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <PH0PR12MB548149234F6B8F894387FAAADCDEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231025062207-mutt-send-email-mst@kernel.org>
 <DM8PR12MB5480246A4E61D071C4C60A69DCDDA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <20231026013059-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54811806D9195E8611DBF7F3DCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CAJaqyWcFKGTpHSUsHePUA4sTp_NthrTs9dzdVKoRcuM6e0G-kA@mail.gmail.com>
 <PH0PR12MB5481402BCC52DCEBF6A90A7FDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231026051556-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481692710B92E5C01A61D4CDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481692710B92E5C01A61D4CDCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v3 2/2] content: Support enabling
 virtqueue after DRIVER_OK stage

On Thu, Oct 26, 2023 at 09:22:25AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Thursday, October 26, 2023 2:48 PM
> > 
> > On Thu, Oct 26, 2023 at 08:38:51AM +0000, Parav Pandit wrote:
> > > > 2 can be solved if we allow resetting a queue before DRIVER_OK,
> > > This is just the hack of enabling and reset for no apparent gain.
> > > Future devices may have many queues and enabling 1000 queues, resetting
> > them is just an ugly interface.
> > 
> > Yes I can't say I love it either. The main driver is to try and make it possible for
> > device to know in advance the max # of queues that will be used. We could
> > alternatively just add this in a config register maybe?
> 
> I didn't follow your suggestion - what you want to add in the config register?

The reason devices want vqs to be enabled before DRIVER_OK is so that
they can preallocate device resources. Problems with this:
- no way to fail
- wasting driver resources too

Idea: a new writeable common config space register max_vqs +
a way for device to fail. Maybe set it before FEATURES_OK?

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

