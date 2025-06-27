Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 266A52D3ED8
	for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 11:53:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751025198; cv=none; b=WrmcpRvu6l3H9crMm0ZBBuEu+W6y6Im6fnN79RPxsjs+1p5iZnvwiIlgF/KZ8r24bibf4NAsPP2pfH/evMtLS2rxQaEiMA/EMTkG/35rXKrvyswCvmfBJMUO2R+rsDR1yXhbAmlb7L5YvHSna9uzNP5wqhzxbkzbeErD/rd2AgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751025198; c=relaxed/simple;
	bh=vlVf6L4+rm2jQdWSIsB6vMunvAsRcbvKywIrX6acLGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OB3GAfZ5t4rbT1G41Bvj/HXwXmNms1MLeWO0qtzZuJt0hYQbdAW0TmlNiw5XFTYEAn+lK6ZloXUU/rR64ljFptXZaXVjnpauZ7l5UGY3/13i8mSTKq0ATbYiMe/YD6k0tZ1RtK6H6clg8IzvAKVl+A6IFy6mImYz+ja7oPry6lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C93BPG8J; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C93BPG8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751025196;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ZZNtcyC48JM/Os/vvSXCsdFNDvl/3kOnK1hkbw98sFs=;
	b=C93BPG8JZyqpx+eXrzyOo9OdkdS36rXMT3ZbSRBpHH4QryLS5IJBlS+Dffq4Ab8Wu1GQhh
	7FJdqInFEVh8rYvXmS3wK00TT4muOkBsbhCw0DjOoTOUySW6sShnfIPzYEFbe4MKwowQeN
	W70/XeTzvEUUGesGxVrhDh15KzIcUJQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-462-mqCZQoV1PS2z4ApXcvh8pg-1; Fri, 27 Jun 2025 07:53:14 -0400
X-MC-Unique: mqCZQoV1PS2z4ApXcvh8pg-1
X-Mimecast-MFC-AGG-ID: mqCZQoV1PS2z4ApXcvh8pg_1751025194
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4538f375e86so5481065e9.3
        for <virtio-comment@lists.linux.dev>; Fri, 27 Jun 2025 04:53:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751025193; x=1751629993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZZNtcyC48JM/Os/vvSXCsdFNDvl/3kOnK1hkbw98sFs=;
        b=YIUmYDGri38QHfjiYJn6QAnyMT+O+vUnK5I8hiuGe6/KOtfNughTsmX5EtbNqg6lVU
         2rhsFpC6CLWoDQGFzMYHbpdwQOnUdxMV3yLGNT8SvFOK6zSInpz8hphIWDlJ80UIFB0m
         x4i6D0cwbm0sgOoAT4nX529iLPvCyohj/ybauOHoF5vTvK6ReXgG8haJBkinl/qQiZiQ
         mAMyDSUFCbkKwNsq3ZrEZn0eI57Z5JPaouLxGprSKFT8WLh0OnVfRVmLFZgL2WBF3rSd
         v1z3bhL0jMWYL6W2ky+koJpXUZkqnW7gbB14vvFzHMkoy5a+JTQkoPTHIiYKfN3S5C/o
         3+kA==
X-Gm-Message-State: AOJu0YzCvgsiFaEzKjAL31fs4CTVGzL+zz20BYJokpXROV8enBWV+IcP
	b0MOs8Qo35mQjRfIQk0hJijU7NggCGBlgHu243MxE9FAc3xGEgozAXnPXbP17N4MpZYEAc0Hyl3
	zHKe2UVcUYVd80+qdrXL5DPx1AWT8+kKM9Jn1W+LaLqLnFZooHyaQE3cjQJqwiS745bCk
X-Gm-Gg: ASbGncvq3lcfNsmjlDgqs1xEiHFxcvIE64hKOmwMJmQVRSQq3AjQ4+dBEPS7eYbbaXn
	aFUBZFfc8BBQDik22jk63IxTVdnG7t9/xnbdYgk5sfo+5GaemnKzmQtmwR0lqsb71UXvUBEdmfU
	XDdxluWrxZDXSDmmuK4lEO2C+ZU7Bv4jr7vLa2BUqmxOJMAccvkwtztwvjg4Hy292ZO4l07H/E0
	sTccFx0w+ZiXwuJc4QqLlu8CC5NsB5RmxUSqaHfON7w8qQhPkImwCUWRUKMxhGx1etQUw6BVHPD
	0n0reQc3a2gE78nn
X-Received: by 2002:a05:600c:a4c:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-4538ee61b50mr37372165e9.31.1751025193358;
        Fri, 27 Jun 2025 04:53:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNlKIVwSHgkCHnwxPhcOGXaIS8Ec98eJaGAKD0Uz0AboyN0mfk/GiF5R/4aGWSHSlqAhFuWw==
X-Received: by 2002:a05:600c:a4c:b0:43d:300f:fa1d with SMTP id 5b1f17b1804b1-4538ee61b50mr37371835e9.31.1751025192915;
        Fri, 27 Jun 2025 04:53:12 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:152e:1400:856d:9957:3ec3:1ddc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a306a01sm51123955e9.0.2025.06.27.04.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 04:53:12 -0700 (PDT)
Date: Fri, 27 Jun 2025 07:53:10 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, cohuck@redhat.com, mvaralar@redhat.com,
	shahafs@nvidia.com
Subject: Re: [PATCH] introduction: Clarify RFC 2119 key words usage
Message-ID: <20250627075203-mutt-send-email-mst@kernel.org>
References: <20250627041954.400922-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250627041954.400922-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Y_RKQfQsrknpy1JzRbPYyYESqi5GNlVDcN6dqkfrTqc_1751025194
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 27, 2025 at 07:19:54AM +0300, Parav Pandit wrote:
> RFC 2119 key words should be used in Requirements and Conformance
> sections; these key words to be avoided in rest of the sections.
> 
> The motivations for such clarity are:
> 
> 1. To clarify the intent:
> These key words carry precise semantic weight. When a spec says MUST,
> it means compliance is not optional. Using such terms in general or
> explanatory text risks misinterpreting guidance as a requirement.
> 
> 2. Avoiding Ambiguity:
> If normative language is used in non-normative (informative) sections,
> it becomes unclear whether the reader is required to follow it or
> if it's just background or suggestion.
> 
> 3. Informative sections explain context, rationale, or examples.
> Normative sections define rules. Mixing the two muddies the structure
> and weakens the authority of the normative part.
> 
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/230
> Signed-off-by: Parav Pandit <parav@nvidia.com>
> ---
>  introduction.tex | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/introduction.tex b/introduction.tex
> index 80aa67a..4e7ab59 100644
> --- a/introduction.tex
> +++ b/introduction.tex
> @@ -196,7 +196,10 @@ \section{Terminology}\label{Terminology}
>  ``SHOULD'', ``SHOULD NOT'', ``RECOMMENDED'', ``NOT RECOMMENDED'', ``MAY'', and
>  ``OPTIONAL'' in this document are to be interpreted as described in
>  \hyperref[intro:rfc2119]{[RFC2119]} and \hyperref[intro:rfc8174]{[RFC8174]} when,
> -and only when, they appear in all capitals, as shown here.
> +and only when, they appear in all capitals, as shown here. The use of these
> +key words is recommended in the Requirements and Conformance sections and should
> +be avoided in other sections.
> +
>  \subsection{Legacy Interface: Terminology}\label{intro:Legacy
>  Interface: Terminology}


The spec is for the reader, who has nothing to gain from this and will
just be confused. If you want to start a document with suggestions for
contributors, that might be a great idea, and this might belong there.

> -- 
> 2.34.1

