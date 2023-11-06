Return-Path: <virtio-comment-return-8211-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560BCC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:21:27 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BB54E790EE
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:21:26 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id AEC3F9867AB
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 11:21:26 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id A54EC98671A; Mon,  6 Nov 2023 11:21:26 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 97AA298671B
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 11:21:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: wWNeHQMOPwGUHK_Ijs9WnA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699269683; x=1699874483;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l7kP128eooxB/ltKpTCSLiC6YGyewwTSYkL9dHu6eJ0=;
        b=epCAQiuQUgYv4ME98APbsLj2/B0hJ28qvSfNbV12b6+2bjEZvgxfP+O3iJoNJ75PPA
         8yD9zIHgb5BOq1QhFMkhyxUqyQrm7FXgT5B3KhVsYHaoEj3FXn08DyyPl0YE6OGTzr53
         cf6qY6wV2sULQtZIwQCLGfzNrENE6TwLBAkmRBmTk/SO1KtOFx5SqZg7Y5pA60XW150Q
         MsQSR8g+yhWdp/cs8FnxyXyo0KwMj3POGGE0GD/uAD53SUoTOlAelSnoACPegDcIG0+h
         qzYpPRhSjAs2zF3xAcX5yjzjYHBtOtOKkO6Eb3lNs+7z9yRBvYfQkrkmm8kDPXlzF4te
         GYZg==
X-Gm-Message-State: AOJu0YzVXN/aFizQPxUnne0rTh0wstfV/v8VKgeduV7NaJaPdMgrWMhj
	Nwi1M0a84FvipXoccFBPDFO5Nqdb4nkcKS2shW5XjUgfsCrd0uagizmi/J7QX91trVbbdiuVjII
	k7sSVQ77atj6hU6WOYS11iDrrK2+0uYtfqg==
X-Received: by 2002:a5d:670c:0:b0:32d:8431:341e with SMTP id o12-20020a5d670c000000b0032d8431341emr18592703wru.62.1699269683403;
        Mon, 06 Nov 2023 03:21:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHlKUrgRIe6iPeMQOsVCdYouFt05TE5F3y+hH35HokqPCxvb6jYS22K0zBnYCImPBMFuoMoLQ==
X-Received: by 2002:a5d:670c:0:b0:32d:8431:341e with SMTP id o12-20020a5d670c000000b0032d8431341emr18592688wru.62.1699269683089;
        Mon, 06 Nov 2023 03:21:23 -0800 (PST)
Date: Mon, 6 Nov 2023 06:21:18 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231106061645-mutt-send-email-mst@kernel.org>
References: <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <2615baa2-9450-4504-aa8a-e46fdbb332b8@intel.com>
 <PH0PR12MB54813004E47B8F18DFAC1D57DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20231106060447-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481F256FE79844AA66CA035DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481F256FE79844AA66CA035DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Mon, Nov 06, 2023 at 11:07:24AM +0000, Parav Pandit wrote:
> 
> > From: Michael S. Tsirkin <mst@redhat.com>
> > Sent: Monday, November 6, 2023 4:36 PM
> > On Mon, Nov 06, 2023 at 10:52:46AM +0000, Parav Pandit wrote:
> > > I read the pci spec and I see only 3 operations which does not have atomic or.
> > 
> > CAS+retry can be used to implement any atomics including atomic or.
> 
> Yes, we considered it. the PCI backpressure is lot that negates the value of such retries for such small transactions.

if there's some locality device can buffer these up maybe,
though of course the chances of a failure increase then.


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

