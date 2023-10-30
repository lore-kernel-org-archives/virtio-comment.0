Return-Path: <virtio-comment-return-8037-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 934B3C4332F
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:27:57 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id CCF042AC72
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:27:56 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A7F6C986B37
	for <virtio-comment@archiver.kernel.org>; Mon, 30 Oct 2023 11:27:56 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 88E38986B2B; Mon, 30 Oct 2023 11:27:56 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 7953B986B2C
	for <virtio-comment@lists.oasis-open.org>; Mon, 30 Oct 2023 11:27:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: 2WgIf7JmOum0glDGrx1asA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698665273; x=1699270073;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HmyCeBu82z1wwyI5Mop540aiTT0zja/DNMDdT2CWW94=;
        b=cat6W2Bxd6IElyp5yDq/mIXklMdhfvgt5KgTgkDGuRYDRg5uVcg5K8iswB27L9/UEZ
         Xht1C+QNtfPW0xXtfl2KktlzjlfHbZgZwg65ajXq2gJmfYruPph/nfS+JyCm7HVYUMT8
         3FO0LIbmO6QHxhhcjCm0qoqUikbYLOmCXHPrPRVTBBgYyfUtWuqK0q6Ws0KmHHuNMf8i
         4baatovIPNdWOw5CBnsJZeEqPTEIRmh+lnUukQLJjYYC192f178gZ321zXzo2qhYYzsD
         1kgeX3C/uQxYEOCS6Dr/6TXI9w1lyDO+P6NIeqeJxIkSJv/YkRT6gx21CJdru+RnbIkB
         pndw==
X-Gm-Message-State: AOJu0YwgVNVIVUrY6//siriz7FCZcvKd2uTT8lWKCOlrkh2S/vpfD/fi
	xQtfQUcEGWfw2TJRQPK03uGC4vjbWrxF6/J7rhVKEWrfOan3XEC5J5Oh6Be5onuSYur6SKh/vh4
	SGPfV9RwImpLLJfKyyIWzmbv4PphCCibHfw==
X-Received: by 2002:a2e:a48d:0:b0:2c5:1b02:2d37 with SMTP id h13-20020a2ea48d000000b002c51b022d37mr7279036lji.6.1698665273200;
        Mon, 30 Oct 2023 04:27:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE1rW6P796twTLMve0rz0uWkSJFGrPorKYqyu0SyRPQG3VFQCFeIy4cyU5u1hwJ9G/f0Da3vw==
X-Received: by 2002:a2e:a48d:0:b0:2c5:1b02:2d37 with SMTP id h13-20020a2ea48d000000b002c51b022d37mr7279012lji.6.1698665272574;
        Mon, 30 Oct 2023 04:27:52 -0700 (PDT)
Date: Mon, 30 Oct 2023 07:27:48 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	Jason Wang <jasowang@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sburla@marvell.com" <sburla@marvell.com>,
	Shahaf Shuler <shahafs@nvidia.com>,
	Maor Gottlieb <maorg@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>
Message-ID: <20231030071652-mutt-send-email-mst@kernel.org>
References: <daea1f54-1c85-4a4a-ac3a-c5ae97180e03@intel.com>
 <PH0PR12MB5481BE51210D429FA12EAB45DCD4A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fb012148-a71e-4856-95fe-6e75f011f3fb@intel.com>
 <PH0PR12MB54819C3A4BC9BB419715AB73DCDBA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f2707430-bb1e-4dcd-b0b3-2b9a705e555a@intel.com>
 <PH0PR12MB5481033BB7C0BCABAE329B13DCD8A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <f9a604b2-7bc9-49ce-bd28-59909f0a5fec@intel.com>
 <PH0PR12MB54815B589B8F5489FB493465DCDFA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <9604eb82-8efd-46cd-8b15-90fc637eff0c@intel.com>
 <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481E6F72E2F15AC88E6E24ADCDDA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] Re: [PATCH v1 3/8] device-context: Define the
 device context fields for device migration

On Thu, Oct 26, 2023 at 07:04:38AM +0000, Parav Pandit wrote:
> 1. It breaks the future TDISP model

I really think brinding in TDISP muddies the waters a lot and
should be avoided. We simply won't know until someone does the
legwork and proposed the necessary spec extensions.
In particular current legacy access commands are I thn


> 2. Without hypervisor getting involved, all the member device MMIO space is accessible which follows the efficiency and equivalency principle of Jason listed paper
> 
> I hope you are not implying to trap+emulate virtio interfaces (which is not listed in the pci-spec) in hypervisor for member passthrough devices.

I feel this discussion will keep meandering because the terminology is
vague. There's no single thing that is called "passthrough" -
vendors just build what is expedient with current hardware and
software. Nvidia has a bunch of people working on vfio so they
call that passthrough, Red Hat has people working on VDPA and
they call that passthrough, etc.


Before I mute this discussion for good, does anyone here have any
feeling progress is made? What kind of progress?

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

