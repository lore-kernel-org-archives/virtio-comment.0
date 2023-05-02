Return-Path: <virtio-comment-return-5700-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEDFC77B7E
	for <virtio-comment@archiver.kernel.org>; Tue,  2 May 2023 07:41:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 67CE9F3F45
	for <virtio-comment@archiver.kernel.org>; Tue,  2 May 2023 07:41:44 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 5B4B3986491
	for <virtio-comment@archiver.kernel.org>; Tue,  2 May 2023 07:41:44 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 52A56986466; Tue,  2 May 2023 07:41:44 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 419BA986479
	for <virtio-comment@lists.oasis-open.org>; Tue,  2 May 2023 07:41:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: ylbnoSpqN3q24ioltksL_Q-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683013300; x=1685605300;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yNB2iFxhRQ0Bl07os+eJCPhi53YeNXW/csSfvbn4nKQ=;
        b=RpXafDp1SfubDH0J8nsnW5U07AM42YO5jC+cJHTaq1GHncYC5Tt3XsNhBF1PmII515
         42gVQfPaldZvtyteK0ZltNdjEfsSm80aso9ZnurVIkIUQ+0Fab0ttfpEHfPPCd7Ft0U2
         iIZgBOhtHE+KwxywbijSwFWRb+o68mnD74Qog7swICh2lzsKlop7YGtmtENa+8mjDKIZ
         1y+XVqpO2d3A46A5uCDecsaF5S9sfRQpq2/tUjqSfZekLEFLJe7nGZlfNdMWUK9RWkep
         A+rnWDmBDMjeyMkK3cxbJrq9lL3y8NOjisJPH5X1bv6FhkRup532ozPetsZWwkQAiLtP
         gYmA==
X-Gm-Message-State: AC+VfDwaovncnFZIvkYAm6yX0UBAgLX7DKFKkIAEGUnGqPJsn/JOVhm3
	NyQcreLgDu3deAGQQ7PSkc7TLa4NbJ2NyCpEfxyTMuGN8Y6L/j54mtzFN5U/0w94cy9zQiNYVcE
	6ROXWgMN/uQJvj2L9L15IF1osG4GKFTIyxTta5WGVlVIw
X-Received: by 2002:a1c:4b12:0:b0:3f1:70d5:1be8 with SMTP id y18-20020a1c4b12000000b003f170d51be8mr12161819wma.15.1683013300348;
        Tue, 02 May 2023 00:41:40 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7XQIKMMuFXxbYkFcDBPPeZGPdpKYGkPrtKzDzuwvNY0uxCI6ceSGNbmNj4DMeotyGCipgT2g==
X-Received: by 2002:a1c:4b12:0:b0:3f1:70d5:1be8 with SMTP id y18-20020a1c4b12000000b003f170d51be8mr12161803wma.15.1683013300080;
        Tue, 02 May 2023 00:41:40 -0700 (PDT)
Date: Tue, 2 May 2023 03:41:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-dev@lists.oasis-open.org, cohuck@redhat.com,
	virtio-comment@lists.oasis-open.org, shahafs@nvidia.com
Message-ID: <20230502033954-mutt-send-email-mst@kernel.org>
References: <20230501224430.485139-1-parav@nvidia.com>
MIME-Version: 1.0
In-Reply-To: <20230501224430.485139-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [virtio-comment] Re: [PATCH 0/2] admin virtqueue fixes

On Tue, May 02, 2023 at 01:44:28AM +0300, Parav Pandit wrote:
> 
> Hi Michael,
> 
> Please review these two small fixes for the admin virtqueue patches.
> They are on top of your work of v12 at [1].
> 
> Patch summary:
> patch-1 removes PCI transport dependency on deprecated migration bit
> patch-2 fixes admin command command data type to be u8 similar to result
> 
> [1] https://lore.kernel.org/virtio-comment/cover.1682354275.git.mst@redhat.com/T/#t

I can take 1/2 since that's just removing text. Taking 2/2 will mean
more review time before vote - besides me not really
liking that change, are you sure it's worth it?
Was going to start voting today but if we are still
tweaking command format then I can't ...


> Parav Pandit (2):
>   admin: Remove dependency on the deprecated register
>   admin: Make optional command data type to u8
> 
>  admin.tex | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
> 
> -- 
> 2.26.2


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

