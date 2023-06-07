Return-Path: <virtio-comment-return-6220-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F322C7EE23
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:35:45 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 76DBA732E6
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:35:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 625CF986665
	for <virtio-comment@archiver.kernel.org>; Wed,  7 Jun 2023 20:35:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 533B7983C2A; Wed,  7 Jun 2023 20:35:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 3DADF9863EF
	for <virtio-comment@lists.oasis-open.org>; Wed,  7 Jun 2023 20:35:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: IGJZ8jNbPGiFZSp0doKrNQ-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686170141; x=1688762141;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8ntYmsEUp/j21VaZ1OnHawAOGHTatwn6ihVJK/7V2GA=;
        b=Ll/cRMIqelNw+zF6JyqC9hvl7nrdumZuJcOheAi/qvUytg+EyC9BIxjkFI6AJ9F3e8
         EqaIF469CzXokuctQ5xfOxuJRiKzoRFw6GliA26bgdoo67Asnm5R6Jg2y7MIcsTvNCWb
         hh2MzQ9d6LzEJoHms8ENl3AoJptJZjrFa+Q4qXyvzJ6E8u0sFTJ7R0CYO7YKnV4fPSFP
         eLKlt8quNtkqHfvZzoVH2zeI8ntFrPwoEoHjWrwNw+WAeLhacbXjb1pTtnYJNR9Vg9Ko
         8VVs8+TrcyQTJULKNqWtSkoYtUE9IVGF8Dh5ap/oprDiTebLA3tXRaSGpG1f0UFTC8bL
         bKqA==
X-Gm-Message-State: AC+VfDz3xT+nyT42uknRhFPPk+GmmwhaQd1jWRsWagRzbOlp2dvmbvet
	QQDM5vjQPdBHu5ndMJr7W6pzprFlVjBYDoSqFcRAnbWWcMULTPZaGMsDqtAgP1S/ONaxJR/BnEo
	fzdRiMnPzGCr414LgdyfR7hcAha7Tbz+fBQ==
X-Received: by 2002:adf:e688:0:b0:306:8f5b:1b49 with SMTP id r8-20020adfe688000000b003068f5b1b49mr5682755wrm.47.1686170141085;
        Wed, 07 Jun 2023 13:35:41 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6VGdhS0fvxiowqTpFkAFPh18aWzaAKwBbfXkFmFSj1bHKPXh06QoG3pDjw2qHx5EfM/QDX4w==
X-Received: by 2002:adf:e688:0:b0:306:8f5b:1b49 with SMTP id r8-20020adfe688000000b003068f5b1b49mr5682744wrm.47.1686170140673;
        Wed, 07 Jun 2023 13:35:40 -0700 (PDT)
Date: Wed, 7 Jun 2023 16:35:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: "virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>,
	Shahaf Shuler <shahafs@nvidia.com>,
	"virtio@lists.oasis-open.org" <virtio@lists.oasis-open.org>
Message-ID: <20230607162747-mutt-send-email-mst@kernel.org>
References: <20230601220305.587034-1-parav@nvidia.com>
 <20230601220305.587034-2-parav@nvidia.com>
 <20230606180853-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C4357772DE13272EA3BBDC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
 <20230606185016-mutt-send-email-mst@kernel.org>
 <PH0PR12MB5481C7FC00041476C73C3A74DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <PH0PR12MB5481C7FC00041476C73C3A74DC52A@PH0PR12MB5481.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH requirements 1/7] net-features: Add
 requirements document for release 1.4

On Tue, Jun 06, 2023 at 11:08:12PM +0000, Parav Pandit wrote:
> We can debate and change from cvq to new cfgvq as part of the journey.
> It is fine.

Just to stress, cvq has a bunch of drawbacks. For example it is
hard to access from the hypervisor since it's DMA from VF.
This is why I think our direction should be to add a vq
transport that does all config accesses over admin commands.
Or maybe I'm wrong.

But, let's distinguish between requirements, and between
requirements and design. Getting supported counters is a requirement.
Doing this over cvq is a design. Reducing MMIO registers is
a requirement. OK?


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

