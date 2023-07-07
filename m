Return-Path: <virtio-comment-return-6790-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD3F8EB64D9
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Jul 2023 08:32:22 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 78DCB42588
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Jul 2023 08:32:18 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 2976298680D
	for <virtio-comment@archiver.kernel.org>; Fri,  7 Jul 2023 08:32:18 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 1D053984091; Fri,  7 Jul 2023 08:32:18 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 06F389867EB
	for <virtio-comment@lists.oasis-open.org>; Fri,  7 Jul 2023 08:32:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: pgnmkzmUMxuFWTqGxkBhpQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688718733; x=1691310733;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LgzJ5F+TP1sVDUpQSScY0cb9etuqeoi88b4RmgeP3yE=;
        b=H5E7eukr7H7aRBI+yqaMffJ81SFsTB6VhwndGIvNmVmeSCt0LMZgkeSzD3VvyNpv7x
         WO2RW7ifVjStcfP+15DJOvnxZuEwxrOAOJt6DK9MqArKgWx1sH6iiSdQb/djSXkxrBuJ
         uOTlPBM5OdiXb4XHxX5OsTGun5TqkCQn4gWAvzCBxHa0+gWpM6ZwnsUS6wPsHNwPID2v
         A6oMiXRijJdE567lQIE6E5pEw5iOk9nQHB3YJr7BP/u/QYcT6N6zhGk8pwLDWXLDhlX7
         esh6dTxYLcu2/TKZ5Jj2/xKdIh12BGi0ELHM2I60GHpVJCaAyVq5r1mEA3cETeImO1Xl
         Z4dg==
X-Gm-Message-State: ABy/qLb5UgAtXymS6c3EsOb9etOb9pBYQN5PNHEAEEHedm7+TyJSXJhX
	2vO/xmAiZG+x9Pr1Jd/UfYBqkxK8nm+tcvNH7koKaGB49wNbLeahQm9BULkyB2KIeL0+Z+cvlsZ
	Tdz/ZGD/pgaw+gq4E2zqJpoBtpnG4sl6UBQ==
X-Received: by 2002:adf:f9c9:0:b0:314:2132:a277 with SMTP id w9-20020adff9c9000000b003142132a277mr4804959wrr.9.1688718733637;
        Fri, 07 Jul 2023 01:32:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFQ5U5WjMowTW3wJixbVbrMzLjlkTllRywqmfmE/oraEXmtQtrYjwAPowgP81BKBIAQtXx6sw==
X-Received: by 2002:adf:f9c9:0:b0:314:2132:a277 with SMTP id w9-20020adff9c9000000b003142132a277mr4804943wrr.9.1688718733357;
        Fri, 07 Jul 2023 01:32:13 -0700 (PDT)
Date: Fri, 7 Jul 2023 04:32:08 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Cc: Parav Pandit <parav@nvidia.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	"david.edmondson@oracle.com" <david.edmondson@oracle.com>,
	"virtio-dev@lists.oasis-open.org" <virtio-dev@lists.oasis-open.org>,
	"sburla@marvell.com" <sburla@marvell.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>,
	Yishai Hadas <yishaih@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
	Shahaf Shuler <shahafs@nvidia.com>
Message-ID: <20230707043025-mutt-send-email-mst@kernel.org>
References: <PH0PR12MB54817A61E0062B9BF3401836DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706145538-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481074A79C630384382CB20DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706154002-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481AF3000FFDBA2CBA5D7ADDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706162505-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481B7E0DE415B1489818DE9DC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230706164028-mutt-send-email-mst@kernel.org>
 <PH0PR12MB54814132C3C74F00CD6F399BDC2CA@PH0PR12MB5481.namprd12.prod.outlook.com>
 <87v8ew16oc.fsf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <87v8ew16oc.fsf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] RE: [PATCH v10 4/4] transport-pci: Introduce
 group legacy group member config region access

On Fri, Jul 07, 2023 at 10:12:35AM +0200, Cornelia Huck wrote:
> [Also, I notice that the discussion seems to get bogged down in tiny
> details, fundamental statements, or a mixture of both. It might
> sometimes be helpful to just step back, re-read the original proposal,
> and only then answer. Otherwise, this leads to frustration for everyone
> involved.]

I feel in this instance we are actually good. All that's left is
small details that's why we are discussing them.

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

