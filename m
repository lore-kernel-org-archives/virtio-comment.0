Return-Path: <virtio-comment-return-5202-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F272CC7618D
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:07:37 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 24F4541A11
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:07:35 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 952669867BF
	for <virtio-comment@archiver.kernel.org>; Tue,  4 Apr 2023 07:07:34 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 8A00E986787; Tue,  4 Apr 2023 07:07:34 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5F34898663C
	for <virtio-comment@lists.oasis-open.org>; Tue,  4 Apr 2023 07:07:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: umaWh8XpNpKNYZHVYff8tg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680592051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TvU1MQxWBcitwvZcLcf2ltQ5T9q2zVggol0iKNTsiZ0=;
        b=NJPROdpeP7wLb/hhtdQcIdAMurjdchWyC9j3T22PjwRNZyoX/T1A4k5HZRsrEmnefu
         9y6tl7dnEhLjRXzLoNRqGKj4YplCjFeetSXfOdkb811f8dcjVAGiLsj8dPqbQvnQ2ug5
         gtUxt48NJ3tB0X5jm6xnyRWc4sYFIIRHaApls+D8tEz2/7teQavmTEj7cDHnsgd4v3W8
         CkEVdQmwmG7ceo1rnthYX7/WoIaPHxWJaotzNf0wk8peaMi1zYQjxDn119B/ndSlElcP
         +ojUWBcVwOS6ab6nWeTnv6tOatYz43nG7DW5fxa3jUTELzYqU75wJzTMhOzspCQPx8gB
         b5LQ==
X-Gm-Message-State: AAQBX9eK+RWLREHZIzrtL9Ri7lNjJEIJbKwTySRnROocf6Xo47yatiK8
	bo1xtnw0LpeGMl1WJ9GPQ8OebWciPZdGxg2M0RKHeRFNZ8QH7LXCvGuo4KPfKlkAT80/SdSWyPQ
	N7TYZvcOgMbJyKLKoN4HN82Fvl25RS3xxrw==
X-Received: by 2002:a05:6402:337:b0:4fc:494a:98f5 with SMTP id q23-20020a056402033700b004fc494a98f5mr1519943edw.29.1680592050971;
        Tue, 04 Apr 2023 00:07:30 -0700 (PDT)
X-Google-Smtp-Source: AKy350aGANzJsA81TI7x4QNJqbJwhMPfdI7D4EmGxgNrpe08/hCJYxVnJWg4InpeH5YugkBuj2c22w==
X-Received: by 2002:a05:6402:337:b0:4fc:494a:98f5 with SMTP id q23-20020a056402033700b004fc494a98f5mr1519923edw.29.1680592050700;
        Tue, 04 Apr 2023 00:07:30 -0700 (PDT)
Date: Tue, 4 Apr 2023 03:07:26 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: Halil Pasic <pasic@linux.ibm.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"cohuck@redhat.com" <cohuck@redhat.com>,
	"sgarzare@redhat.com" <sgarzare@redhat.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230404030629-mutt-send-email-mst@kernel.org>
References: <20230329212341.465843-1-parav@nvidia.com>
 <20230330191114.77acd860.pasic@linux.ibm.com>
 <PH0PR12MB548165C4B11375F8C7EE7AD1DC8E9@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230404033622.4b749f89.pasic@linux.ibm.com>
 <d62d2090-de0d-0ea6-5c85-ecf19ae828c7@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <d62d2090-de0d-0ea6-5c85-ecf19ae828c7@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [virtio-dev] [PATCH v10 0/8] Rename queue index to queue number

On Mon, Apr 03, 2023 at 10:57:35PM -0400, Parav Pandit wrote:
> 3. Once interrupt moderation series is merged, rename vqn to vq_index.
> (really vqn reads better even though history say vq index).
> Because votes is completed and voting period ended for the important
> feature.

interrupt moderation voting is still ongoing, isn't it?

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

