Return-Path: <virtio-comment-return-8560-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAED5C61D9B
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:44:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 0169026A33
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:44:04 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id BFA189868AB
	for <virtio-comment@archiver.kernel.org>; Wed, 22 Nov 2023 14:44:03 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 99EFD986898; Wed, 22 Nov 2023 14:44:03 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8A8BE986899
	for <virtio-comment@lists.oasis-open.org>; Wed, 22 Nov 2023 14:44:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: GL0N7T2BOkaqx585UNkh7w-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700664240; x=1701269040;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cGRRBJLEIu+7SEmx5M2fQQB+YabOSXYWGRT8MfEfDp4=;
        b=SQFPf97RnzzLRdNEcNH6iaUhXdo/bK+ktgwDTaAcEIZ2GVo2DGxLl8OFW1ATRuGDwY
         IucQJBWDZRHWHBgbg28/ouLXpPMYGCt45pF0pxOd0D7o8oIl79ATjBpzkTzefUr/DjKW
         JBe/tC5jwOc3TV7j62g/GaYgUlSjJ2TOwlYadMw4Dc87CqGzVruB1L/R+K67lcUJyUJf
         g9b0wo6u+zTy5ILm24/mDUJHXAa1sB1cB4mIDeQ5ugyUNm3B6nQkHerUvth3gsDq1Mj2
         RGDsAlChaXXW7EcsoVjO0/o9dqmjUL3yFHSrbEMPiVafEeUq8M9bL0v+yzldh3NNt9hl
         nSug==
X-Gm-Message-State: AOJu0Yx/cnM1FzOCZHDYoO1ikrtghV+Bi0YiFrQfaW/5MOfHN7NVQ6dr
	gkE4pao850XG0e9EzFOMWPjDKSj8b5QZrA+Yj2EOGPqEXVNLwq/rNoNT0xFcmoCLDU5Y5vXnX+J
	pNnPldY6h0rrbmG7I7MI2CoKbC9zabrVZ5Z1stseBYQ==
X-Received: by 2002:a17:906:2215:b0:a01:8ff7:5f9f with SMTP id s21-20020a170906221500b00a018ff75f9fmr2064806ejs.15.1700664240119;
        Wed, 22 Nov 2023 06:44:00 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEOEE4QVK2u0D6boEmTAiVv+hv/cMxxaQ4VDWW8C8KjP7VbyFjlMB4flyVjinHJh4xuZKZr8w==
X-Received: by 2002:a17:906:2215:b0:a01:8ff7:5f9f with SMTP id s21-20020a170906221500b00a018ff75f9fmr2064791ejs.15.1700664239663;
        Wed, 22 Nov 2023 06:43:59 -0800 (PST)
Date: Wed, 22 Nov 2023 09:43:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231122094149-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54810113B095063A5B875A03DCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <166b43a5-b301-486f-9cc4-01a1cc80eed4@intel.com>
 <PH0PR12MB5481F872AE828217D6CC8FEEDCB0A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <d96aed6b-6194-41f6-9f4a-e20fe29797e4@intel.com>
 <PH0PR12MB5481501A7771A21583B905B1DCB7A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEvNoLny_VPaQ5Ooob3cEystgdc6xi24G5wScT5FUdVz_Q@mail.gmail.com>
 <PH0PR12MB54815513853CC3299D2DBC7EDCBBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEtBbDS91gKf1pGiWNBLXatS0PjPJDEU4JtC6=uAjrOBzA@mail.gmail.com>
 <20231122015435-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481939D87A1E28C35D718B1DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481939D87A1E28C35D718B1DCBAA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH V2 4/6] virtio-pci: implement
 VIRTIO_F_QUEUE_STATE

On Wed, Nov 22, 2023 at 07:33:41AM +0000, Parav Pandit wrote:
> Nesting is not a virtio problem

Really virtio problem is whatever virtio TC members are willing to
tackle. I support work on nesting exactly to the same level I support
work on platforms without memory change tracking.  Both are
non-universal, platform specific problems that platforms might address
in the future.

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

