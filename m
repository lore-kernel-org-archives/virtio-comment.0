Return-Path: <virtio-comment-return-8202-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF35C4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:52 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id B91DB2CAE7
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:51 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9731798672B
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 10:29:51 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 7F55798671A; Mon,  6 Nov 2023 10:29:51 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6F4ED98671B
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 10:29:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: DoCXSe2XM7C8iOXMYdWKCA-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699266585; x=1699871385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hNg0HcF7hUWBCIVXMa+MG+IqXm1SxVRlhARsFZkjOJ4=;
        b=mP+O2WZszEakvTNoT+zM7j5ZawjSdl3eh0EJ79sDCvvSavd8lVEz2QqI8SfJqbmfJW
         5iw8zdnvafz83LV5soqSCVkO+NpsOnhG1I0Zk9kXOqf9xjVjtGLlUkOAX0l1y2x5Y/DE
         3ON533sMfo6oX6ncCx6TkXPsxgJCK6mWosK5KI0ark+ZkA2SPc+AZAExj3HoqTWjXaNa
         jHzZeFQQQ/hv26PPX4QHyzLf8B+H/c+P7pTej9DxQssTt9RFl4kJUDXt46eMGTKBheJ2
         KnIk5HplBOiJk9Ep+jrCFRQbAbImMrazTB6yt4+a7TSgPnBDxxFqUJ90OUgDKWz1zFiS
         NZ7Q==
X-Gm-Message-State: AOJu0Yw3V/1EpUYE+qyWLB4OXOPWgHbHd/spACHq7Rb0gesbQmyUXTOW
	NaEJ1X2CW4QXASJ79ig/00u9pZ9ft2A+m9rbQgmkAG9QsQzmLTv7VdQAs0UPWx90XfrRFNRmUlV
	IJ7KDKjv31O+ocBg1TG6w8ivythbdu6LSSA==
X-Received: by 2002:a2e:2c09:0:b0:2c5:14eb:1086 with SMTP id s9-20020a2e2c09000000b002c514eb1086mr21684229ljs.24.1699266585460;
        Mon, 06 Nov 2023 02:29:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZRGYUHQOxSheHqYBoeNvaXlSM/jrBzTI2jMUVznuvo7GtjaIGWy8rLyoLa0HKAiXRRpK0Xg==
X-Received: by 2002:a2e:2c09:0:b0:2c5:14eb:1086 with SMTP id s9-20020a2e2c09000000b002c514eb1086mr21684203ljs.24.1699266585174;
        Mon, 06 Nov 2023 02:29:45 -0800 (PST)
Date: Mon, 6 Nov 2023 05:29:41 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "Zhu, Lingshan" <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231106052340-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <fdfda658-e89c-41f4-9f4c-77d5d9b1b642@intel.com>
 <PH0PR12MB54818179419B06412D7A9C84DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <445ff573-72c3-4fe4-9e07-e7fdd2dc5750@intel.com>
 <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB54818BAE4BD33983E6108FE5DCAAA@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Mon, Nov 06, 2023 at 04:34:44AM +0000, Parav Pandit wrote:
> > Do you know there are locked transaction and atomic operations in PCI???
> Can you explain how PCI does RMW locked transaction?
> Is it one TLP or multiple?

Parav what are you asking about here? pcie supports CAS and Swap which
likely can work for this use-case - these are non posted writes. It's in
the pcie spec. Zhu Lingshan if your proposal relies on this then you should
include
- explanation on how it's supposed to be implemented using AtomicOp
- some data on how common support is or is likely to be in the field

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

