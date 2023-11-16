Return-Path: <virtio-comment-return-8392-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE892C197A0
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:50:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1F6CF2A8E4
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:50:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 17B62986DDD
	for <virtio-comment@archiver.kernel.org>; Thu, 16 Nov 2023 06:50:45 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 0CCEF986DD1; Thu, 16 Nov 2023 06:50:45 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id F300F986DD4
	for <virtio-comment@lists.oasis-open.org>; Thu, 16 Nov 2023 06:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 91ncHzPONVCkLV5EU6IPFg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700117442; x=1700722242;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cprr7TlwaEdGXwpv4YOp7ch7stD9vmSQ+4TCw0aOayE=;
        b=jR9uh2njD3O0idK5V8uOD0NFM8ai5ggmraVII7xLQ+IczTe6h16VljuTv9otU4AGbP
         7xA4OKN5S3HgQU5FOpyv4wrS4ULP4ORYUGsSMBOmh77QxasJYM89vxbU0YcP1TCAia5m
         iGJOPF5iLbVhpU1dxs1EmzzVVB44k7h6KxAlVID0o5hfyl0ksMZY1POVczJExoQMyw/A
         lXELNzFYKPdWJoedv+4xz1FCzyTdpQEJQvZdai99DLYMb40Ci0vq3yeLZnGaxDBumR0T
         TbQFPgXQIcZAdsH/kXVF9HbPlCG+tRPoivkBrkt6OcJa294q6X69c81KyvthBjJsG1VJ
         5NAw==
X-Gm-Message-State: AOJu0YzyQ7RF7GkJlqEz1UInR9YOjg67sDmBXUoTAQFQBWTAg5zyeC0/
	ioyXMthvZnjOd7Axw6F8iPN9A3seVOBWYNDtq23tE65jaF+QJagGtQP/mkQWSVQZwHUFQbt1Vqh
	FupMF6ZwkZPhWufySd3Lhr77DQCiAn6YLVg==
X-Received: by 2002:a7b:cd08:0:b0:405:3f06:d2ef with SMTP id f8-20020a7bcd08000000b004053f06d2efmr588279wmj.4.1700117441908;
        Wed, 15 Nov 2023 22:50:41 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFz9PP0kFd+IH1MnibhWL/qAbziTNTsSaY/Ak7+dCISIfqqlqu5g+ZWWoF9YB652CKHs+ujAA==
X-Received: by 2002:a7b:cd08:0:b0:405:3f06:d2ef with SMTP id f8-20020a7bcd08000000b004053f06d2efmr588271wmj.4.1700117441627;
        Wed, 15 Nov 2023 22:50:41 -0800 (PST)
Date: Thu, 16 Nov 2023 01:50:38 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
	"lingshan.zhu@intel.com" <lingshan.zhu@intel.com>
Message-ID: <20231116014947-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB548152A30021BEBFFCA62AA9DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEv8mccZfcA4n+KVwdkaWAqhM94Qhq8H5Rvw2CocCmt9UA@mail.gmail.com>
 <20231107015412-mutt-send-email-mst@kernel.org>
 <CACGkMEv+jir2+f_vHmi_KjFXf0yz+EQmEbvzX0pheHKsVJkWZw@mail.gmail.com>
 <20231108025854-mutt-send-email-mst@kernel.org>
 <CACGkMEvkQawXWCvu7rZHnZk8YsNunS_B-fcQmEHEe_N87Q6y6g@mail.gmail.com>
 <20231109022647-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54813C84CFA5601DB1B47885DCAEA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <CACGkMEu-Zs-dxcYRjtV+hLBVy5Tv9JzgT2c83Zjzt7A-a1QR2A@mail.gmail.com>
 <PH0PR12MB54810DA3AAA7631319B2C1BFDCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54810DA3AAA7631319B2C1BFDCB1A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH v3 6/8] admin: Add theory of operation for write
 recording commands

On Wed, Nov 15, 2023 at 05:37:46PM +0000, Parav Pandit wrote:
> > What does DPT mean? Device Page Table? Let's not invent terminology which is
> > not known by others please.
> >
> Sorry for using the acronym. I meant dirty page tracking.

:)
Yea don't make up new ones please.

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

