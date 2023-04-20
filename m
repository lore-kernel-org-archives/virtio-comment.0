Return-Path: <virtio-comment-return-5561-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4C7C7618E
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Apr 2023 20:32:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 1B9D92B02A
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Apr 2023 20:32:28 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 0029B98663B
	for <virtio-comment@archiver.kernel.org>; Thu, 20 Apr 2023 20:32:27 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id E605A986635; Thu, 20 Apr 2023 20:32:27 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id D0630983DDD
	for <virtio-comment@lists.oasis-open.org>; Thu, 20 Apr 2023 20:32:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-MC-Unique: -_PrD2XFOfevjJrFTtC_Vg-1
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682022744; x=1684614744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0FOpHFaAs+DuDz5mAaX9ANVlTWQeBMsRGoDcsv0LXys=;
        b=A9ngJAJcJuTNzwoAiKZYJVYEe2OazHNdox5VXrZ6HMVsudEEZVwxNSfiSIEgGYf+Uz
         0jmxcISFw6JE1IBeA4eGCm1a6TuSO/oSx4GQb47n69KJxrYcpmH9zeA3tElG3+WCER8j
         /9lS4XDwNh+vklMQqa0Oer0w+H+LJd0+o8daEwhJO4rtKeqY0YChiIA9apsIPT55AvV9
         65W7rkhf3XrCa+BM8IKSy9CZsL9CHpO8LQgHfqxeRGM/RoLZNQsj8m0kljK1xR3c47HY
         TEyw6mc1dHgbola0f1Yi/wT7R7UiGRk1NV9mmj/dMqUmPW6/PIvk+zYk2vK8ddQuKcVi
         NoxQ==
X-Gm-Message-State: AAQBX9dEHbFd30ifxHAe3FpShV27kY/Q9QB1cvOMXWIe+1HpyznKrc/L
	Pzt6vvxlGXjBLaEXYL7munY4cyLO492IAJKQmqA0r3S3hzybOIPSQ/E/qw/xGBs9htljuTrfrmJ
	W6NIf02+LS5/9TXxp1+b81oAaFQ0RMrBf8g==
X-Received: by 2002:adf:db09:0:b0:2fb:9995:f707 with SMTP id s9-20020adfdb09000000b002fb9995f707mr2146505wri.67.1682022744603;
        Thu, 20 Apr 2023 13:32:24 -0700 (PDT)
X-Google-Smtp-Source: AKy350aybwoiAvDPsym5YHR7fa06lELbwC+tbhGIp18vQJo9sZ5+BWtV0LpA0lIzCGzPhzetA6gaCA==
X-Received: by 2002:adf:db09:0:b0:2fb:9995:f707 with SMTP id s9-20020adfdb09000000b002fb9995f707mr2146495wri.67.1682022744232;
        Thu, 20 Apr 2023 13:32:24 -0700 (PDT)
Date: Thu, 20 Apr 2023 16:32:20 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: David Edmondson <david.edmondson@oracle.com>
Cc: virtio-comment@lists.oasis-open.org, virtio-dev@lists.oasis-open.org
Message-ID: <20230420163158-mutt-send-email-mst@kernel.org>
References: <20230420124647.58488-1-david.edmondson@oracle.com>
MIME-Version: 1.0
In-Reply-To: <20230420124647.58488-1-david.edmondson@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: Re: [virtio-comment] [PATCH 0/2] Minor improvements

On Thu, Apr 20, 2023 at 01:46:45PM +0100, David Edmondson wrote:
> A couple of minor improvements:
> - add "and" between two "MUST",
> - avoid using abbreviated flag names, making it easier to search the
>   specification for the actual flag names.
> 
> David Edmondson (2):
>   virtio-net: Minor wording improvement
>   virtio-net: Avoid abbreviating flag names
> 
>  device-types/net/description.tex | 89 ++++++++++++++++++--------------
>  1 file changed, 50 insertions(+), 39 deletions(-)


Acked-by: Michael S. Tsirkin <mst@redhat.com>

seems like an editorial change. Cornelia, want to commit?

> -- 
> 2.39.2 (Apple Git-143)
> 
> 
> This publicly archived list offers a means to provide input to the
> OASIS Virtual I/O Device (VIRTIO) TC.
> 
> In order to verify user consent to the Feedback License terms and
> to minimize spam in the list archive, subscription is required
> before posting.
> 
> Subscribe: virtio-comment-subscribe@lists.oasis-open.org
> Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
> List help: virtio-comment-help@lists.oasis-open.org
> List archive: https://lists.oasis-open.org/archives/virtio-comment/
> Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
> List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
> Committee: https://www.oasis-open.org/committees/virtio/
> Join OASIS: https://www.oasis-open.org/join/


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

