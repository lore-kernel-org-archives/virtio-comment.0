Return-Path: <virtio-comment-return-8170-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B7EEC4167D
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 16:20:42 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id C064821190
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 16:20:41 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id A35D09866BD
	for <virtio-comment@archiver.kernel.org>; Sun,  5 Nov 2023 16:20:41 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 9084E9866B4; Sun,  5 Nov 2023 16:20:41 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id E5A6E9866B5
	for <virtio-comment@lists.oasis-open.org>; Sun,  5 Nov 2023 16:20:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: D-9fuuSEOcie0k3d7qsB1g-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699201208; x=1699806008;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/b4oN7B9cDvUDtHJlOnBu+hrunTbxPNvcWVdfl6+pvs=;
        b=BJYCYum/+x5rEvjhhsRFdXBBJilnZyS+1JBFL5Cq2FsgPwyIy4zqINXIhGH/k5aNNL
         9M3fvQt55NuK6hovLdjToEQFpvFEV/ecztNuosUeTPyYoJxOmEDw5Id/LXT4XTr7KXNe
         mCo4WPRzCHHQOZyh/OLQD/HTo/nHkh7nkJFtBoBw78PdRvZedipRf/1nJ9kszRfDlI1J
         Z6Mb6QmapGBueG0xE3P6lz8HhEooAtvu3rgaJyNp/fJswVz/12lKnftSl7w5kqwnthd7
         MOG9fO7Eu3po1BKS53mhTjEyzxvkQ/6jF3ckQE7w4dk9VEityLZa02srsvbzlNxDjELR
         kYnA==
X-Gm-Message-State: AOJu0YxoP7QfPGNQ+kGQV7aJrGhe/MhvAyQDVRu9v+8pWQ60xIMJcBbW
	8FU+O+g95yBqKNuST0uuEPjRwcMMwrXnmzXVgG8dZRYn0zBmu07X9dRAed1XE2I/gTSCyetss98
	CJT2us6sp5ohdk7my46nkxDGTTRkcrDJpxQ==
X-Received: by 2002:a17:907:26c7:b0:9c4:4b20:44a9 with SMTP id bp7-20020a17090726c700b009c44b2044a9mr13481122ejc.65.1699201208325;
        Sun, 05 Nov 2023 08:20:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHg2746VbSIhC0Y4dqr14SSSt8LMjyhQy3MeUM7LTLsWbm9VyV/18qWyYSLDrXHSI/U0c+dpg==
X-Received: by 2002:a17:907:26c7:b0:9c4:4b20:44a9 with SMTP id bp7-20020a17090726c700b009c44b2044a9mr13481106ejc.65.1699201208016;
        Sun, 05 Nov 2023 08:20:08 -0800 (PST)
Date: Sun, 5 Nov 2023 11:20:02 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Zhu Lingshan <lingshan.zhu@intel.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	"eperezma@redhat.com" <eperezma@redhat.com>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"stefanha@redhat.com" <stefanha@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <20231105111935-mutt-send-email-mst@kernel.org>
References: <20231103103437.72784-1-lingshan.zhu@intel.com>
 <20231103103437.72784-7-lingshan.zhu@intel.com>
 <20231103064730-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481D028E63E6CB0AA7F4149DCA5A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH V2 6/6] virtio-pci: implement dirty page tracking

On Fri, Nov 03, 2023 at 11:35:03AM +0000, Parav Pandit wrote:
> And you never commented with sheer ignorance.

I think you mean ignoring here. ignorance is something else entirely.


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

