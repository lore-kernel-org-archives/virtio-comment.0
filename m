Return-Path: <virtio-comment-return-7801-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73F48CDB47E
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 08:53:30 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BB7476E6CD
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 08:53:29 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 8DC4498689D
	for <virtio-comment@archiver.kernel.org>; Wed, 18 Oct 2023 08:53:29 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 76EA7986892; Wed, 18 Oct 2023 08:53:29 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 67476986893
	for <virtio-comment@lists.oasis-open.org>; Wed, 18 Oct 2023 08:53:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: lN2ukWA0OLyUuDFAsghVuA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697619196; x=1698223996;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyS2BwkhuxEII65Z+pMdFMku7sutcB30uuqItuV21Ow=;
        b=UBU1oRo+sosAA0Ljl/JiR7i83E3/lzIhJVRHPlwm3mDSYB9MISpADKu+Ed5FbZ6bej
         n+5c6ObQOgiLcyrGuYlDTzClpd3L/So27KTUUZXqJuqflHcjRs4YGpbSuU2j1cuciN+i
         dNSMQk9Xzg69k2cFWGkxk+ouOUHZGiRlHJmlO9ueYJ0lySwYcckLocNj3dRgAlb/UPFI
         4qkd1f+b8q65B90jdYOcTx77jsN9r/6kPNSweiuHvI3FT/JkRu4ZXF4ylH34FBo7JWt/
         +YK7LxKFHeGwnThurbXVsNcSCdugxZz/M4iN6Gvjk1THl2zP8FLeUk9KzgRVqba/sMsA
         Y/UA==
X-Gm-Message-State: AOJu0YwfNkEeF7xeiLSFAGnVY6lTW8H/uFVeZMEbipfwQoaaGt+vcX46
	DVi81TvIjMghXnW5rHjxH9rHbKlHnS5mf+/BlaqINBpMKoCQ3Jy2cJS/51O338B8cnFQsy93eTC
	RIlry7lcvHiJwIkLcHRm0ao3nHK3jiKeqJA==
X-Received: by 2002:a17:907:3da2:b0:9a1:b85d:c952 with SMTP id he34-20020a1709073da200b009a1b85dc952mr4155178ejc.12.1697619196328;
        Wed, 18 Oct 2023 01:53:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFU2i8OtGC8DEQBFIRSe8EWAtoKTaTswDesJXcRpSpunNmxMlzKfAj0G+Qnu5GwEWkzNrpfuA==
X-Received: by 2002:a17:907:3da2:b0:9a1:b85d:c952 with SMTP id he34-20020a1709073da200b009a1b85dc952mr4155159ejc.12.1697619195992;
        Wed, 18 Oct 2023 01:53:15 -0700 (PDT)
Date: Wed, 18 Oct 2023 04:53:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: "Zhu, Lingshan" <lingshan.zhu@intel.com>
Cc: Parav Pandit <parav@nvidia.com>, Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231018044500-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548125EFC96DE6640F9F4A34DCD3A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <db0719f9-7dc2-4a96-b10b-ecc3dac1a82b@intel.com>
 <PH0PR12MB548139B50AD2D1B86AC9A127DCD2A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f7083379-e76c-42f4-8355-ea4ae28eb52c@intel.com>
 <PH0PR12MB548119E2C2EDB212B56E9FACDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <829d27f8-1d9b-4a1e-93a8-a14da626f4a7@intel.com>
 <PH0PR12MB54819FC5A77A46C649CD5B6DDCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <0948cfa4-da02-43d5-a099-424f209f814f@intel.com>
 <PH0PR12MB5481546E859578DE97D9E152DCD5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
MIME-Version: 1.0
In-Reply-To: <860e52ef-8cfc-408a-b3cc-2551ef6118d1@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Wed, Oct 18, 2023 at 04:42:53PM +0800, Zhu, Lingshan wrote:
> And you need to prove why admin vq are better than registers solution if you
> want a merge.

First, no one seems to want a register based solution for tracking
memory changes.  So I feel the point should rather be to prove why is
sticking some migration features in registers and using dma for others
makes sense.  Second I guess we could have a register based interface
for admin commands, no?

I really wish both of you guys started looking for solutions that
satisfy all use-cases instead of just going head to head. Lingshan that
is why I asked you to try and list advantages of the architecture in
Parav's patches. Do you think you could try and address more use-cases?

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

