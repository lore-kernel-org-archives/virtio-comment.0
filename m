Return-Path: <virtio-comment-return-8387-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 623E6C47071
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:23:36 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id AC39B181FAD
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:23:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8B148986DDC
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:23:35 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 6D948986DD0; Thu, 16 Nov 2023 06:23:35 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5CA74986DD1
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 06:23:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: OdI4d5zvOXCDDpXypotcsQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700115812; x=1700720612;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kFr7fRjwe3aPfs5sn64OmcycZVkuwVaVEj5QdDBl0Vk=;
        b=RocYjfrtypvfbgGylyZ7z6jMMBHP8L4LS3N9KnQT7Qs8eZyFV3PH7vhS5Fe55QL6Fh
         7l1rmIPH4OtA8/iLPcswjr0oa9n9Tul/m4v23SqJ7lRskYSqhifQVrHpR80OCZ2IF0Lp
         /1km4uE98WqAsCp87/fkc3AQx/OpZU+1plcHJ0doNv1r74pqd7Tm8IJ6bldouzMfPDwX
         IxNDLG2rQELiOBPjGXbBpSX+V5bgOGw6mySubFVg6daGkWlKCTKnRE+auQJspwphDco0
         jHinm+wBYXX8E9eOSIT0wRCqgJAszN7ht3VuyDUvoZARpaeA+cmwf5yu8kEgEkZJmgl5
         LKDw==
X-Gm-Message-State: AOJu0Yzxf8SMi45MmgT7aL7VtkMSVBJEWSqz8NYdAS6K2Bm3awwes2o8
	tbKf/LRO3Xr3sONciAXRarBqnDIoTdiert6UWX8E9g96EVGM3y5OyP7brJr37tXJr4DrpqgjAc9
	NdEKms4NarCm3iPF/ofYCtPCdYLct0glO9g==
X-Received: by 2002:adf:b651:0:b0:32d:81f7:d6f2 with SMTP id i17-20020adfb651000000b0032d81f7d6f2mr1048143wre.30.1700115812037;
        Wed, 15 Nov 2023 22:23:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHbv3qfjucHhdgvjdsfWWsm5iOcJi+GJWlqnz7B2KjQED2+58VCe492tAsIHQ8TE8r3WwLX4Q==
X-Received: by 2002:adf:b651:0:b0:32d:81f7:d6f2 with SMTP id i17-20020adfb651000000b0032d81f7d6f2mr1048133wre.30.1700115811721;
        Wed, 15 Nov 2023 22:23:31 -0800 (PST)
Date: Thu, 16 Nov 2023 01:23:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231116012208-mutt-send-email-mst@kernel.org>
References: <CACGkMEtKPPudHAXGbrOppwgRP=Umt-F0GNKeoajOGzgs+wvyLA@mail.gmail.com>
 <PH0PR12MB54815F58F470493FC516CDCCDCA6A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsR56_C2b6-YQFpEOPt4sjJKyqcqrdhi9G0vU9ytezFLQ@mail.gmail.com>
 <PH0PR12MB54811373EA43BEDB4E159E0BDCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEsMzp7DjDkQcO4RZ0H0HfxSrytUJrSyDj6gnPWV9cTZow@mail.gmail.com>
 <DM8PR12MB548085F25849CF1E055826E6DCAFA@DM8PR12MB5480.namprd12.prod.outlook.com>
 <CACGkMEsfcEjue1UZmuNs8k65o3HSM94VsweSbWLH3383STR97A@mail.gmail.com>
 <PH0PR12MB548149E1E51DA9C1C094ABCADCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEt277yYUHf98dCkypS-PXzu7JrRSVBAQ2cCRg4XzCLPzw@mail.gmail.com>
 <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481DB04DEB1A540185ED1ECDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH v1 1/8] admin: Add theory of operation
 for device migration

On Thu, Nov 16, 2023 at 05:28:19AM +0000, Parav Pandit wrote:
> You continue to want to overload admin commands for dual purpose, does not make sense to me.

dual -> as a transport and for migration? why can't they be used for
this? I was really hoping to cover these two cases when I proposed them.


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

