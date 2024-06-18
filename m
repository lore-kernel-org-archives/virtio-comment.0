Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2F99156F28
	for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 10:54:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718708100; cv=none; b=H29q9mGYiESfq961RYNsAfpaDpGjyRBZ3qRB431U+4DzMKWn63Ych0c427xHC4B0C0Jf58L8UfnsDbB6w46lsVcOpY9QZgkukguS6H6BmyISp8y6+5T0l/PbMoYYgjDr2f30U+3wQsRH1K6KuOfpU6AzAIb9zvxaRWxxC0mxvmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718708100; c=relaxed/simple;
	bh=EhoCESFbH4a5+Y51/ikKYu8QJvXzibGn61jpfWyzJjY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=bSvJ52Rg3AqAXtHcJMkxO7E/4LxoDP/+TiY90KF86Nnb02OXkL9lEpiZjFN7qf+wZ8l3MOtgRyHTnhco1Z+nkqdf1tRtcPJ/cJ/DvsAZFZ5QNoFX/+OMYrXxQUXORZu0y8WwQOx0P1qrERX6i1zU5QP4OJdmkPQvmBMDGTJ5/kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DiJU2oTL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DiJU2oTL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718708097;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=iMGM5II+H0pL0LUGGmgQZa0DVVBV2RnH1hbySurb0U8=;
	b=DiJU2oTLv5Mye115LeDqWKTbx7l+OTyZuTw7cTtf/ffAvt6tV2hnM5wmK0lHbnuMUyWQ30
	zuL1PaoaICFXpYDHPnoTd9V0phNgNy6coKc7LhGi4OUbn6Eq7TvQyut9awa/KEeftabJzg
	Rnfy1PHRLkQWSLdhJUv1gBkISReKSiU=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-358-rap7IBj9MViCj2h6cYuANw-1; Tue, 18 Jun 2024 06:54:55 -0400
X-MC-Unique: rap7IBj9MViCj2h6cYuANw-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-52c8a4ef5e5so4182556e87.1
        for <virtio-comment@lists.linux.dev>; Tue, 18 Jun 2024 03:54:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718708094; x=1719312894;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMGM5II+H0pL0LUGGmgQZa0DVVBV2RnH1hbySurb0U8=;
        b=hk+JiuyVtGsTvSrPmfvHGadEnpzPm3IV814IZ6G1tNeJjGWfo4n74OfgoHt+odq9T6
         NXEVnoF2u/4H5k0GX100FnIMjSJ6G1lKz1i9bAdHT1tRGSqj2/S9KuKX2jr3+FNU2Fkp
         VUwBSqzeUnWPL1JVYQKMaYwEdlPeu7G/8Cy3/qKlrCjM2dy/FVTHpK0Y7spX+ihjzSTo
         5jdsSxU6ygEI8ytVd+RZLV/vwJd1Qw7oD2e9y59ilNHs6e2na/NOTxAnzFsfUrHb1kG4
         2v0J31uimitsMqc9rmVLTXmmOW9BIYEuVeG0wd5qzY+tJaEz66ngJR5YyZpWE01/Nncg
         cr5w==
X-Gm-Message-State: AOJu0YyUpEfASuVWzf5bPQ61ub5jTTiqLx7NhmSdpmls5VHT7y3dFkcB
	n3YqmPLUALUQSIXgXj3iNAX3VpDAvm0XpZqrUaFLBHxhRcxxYXhftcHBc+XZUg50ZOQeVc+llWm
	QKCZFlvrgezIrkjWoaDCn4eKNuiDnOpFBMavP9afe1qmZ5bH+D4DFVIBeb/jFZ8r8
X-Received: by 2002:a05:6512:24c:b0:52c:84a5:6617 with SMTP id 2adb3069b0e04-52ca6e9eb89mr7116564e87.68.1718708093756;
        Tue, 18 Jun 2024 03:54:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhc3tUFPulHmjifdgEv1nphBc8y4CgZyMI/EEiu5ClIa1FNlsD9U6exfyRk/w0OR3jct/OAw==
X-Received: by 2002:a05:6512:24c:b0:52c:84a5:6617 with SMTP id 2adb3069b0e04-52ca6e9eb89mr7116541e87.68.1718708093163;
        Tue, 18 Jun 2024 03:54:53 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:441:67bf:ebbb:9f62:dc29:2bdc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9263sm221147995e9.15.2024.06.18.03.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 03:54:52 -0700 (PDT)
Date: Tue, 18 Jun 2024 06:54:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Keiichi Watanabe <keiichiw@chromium.org>
Cc: virtio-comment@lists.linux.dev, uekawa@chromium.org,
	takayas@chromium.org, dverkamp@chromium.org, tytso@google.com
Subject: Re: [PATCH 0/1] A new virtio-blk error code for host-side ENOSPC
Message-ID: <20240618064959-mutt-send-email-mst@kernel.org>
References: <20240618081858.2795400-1-keiichiw@chromium.org>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240618081858.2795400-1-keiichiw@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 18, 2024 at 05:18:57PM +0900, Keiichi Watanabe wrote:
> This patch proposes a new error code VIRTIO_BLK_S_NOSPC to report
> the device's ENOSPC error to the driver so the driver can treat it
> in a different way from other IO errors.
> More motivation is explained in fs-devel mail [1].
> 
> [2] is a prototype implementation in crosvm and [3] is in virtio-blk
> driver. Idealy, the error should be propagated to the guest file system
> and handled smartly, but the part is still under discussion.
> 
> [1]: https://lore.kernel.org/linux-fsdevel/CAD90VcZybb0ZOVrhE-MqDPwEya8878uzA1RBwd68U7x4CufkTQ@mail.gmail.com/T/#u
> [2]: https://crrev.com/c/5599649
> [3]: https://crrev.com/c/5600325
> 

> *** BLURB HERE ***


it's a single patch, pls just send directly no cover letter needed.

> Keiichi Watanabe (1):
>   virito-blk: Support NOSPC error
> 
>  device-types/blk/description.tex | 13 ++++++++-----
>  1 file changed, 8 insertions(+), 5 deletions(-)
> 
> -- 
> 2.45.2.627.g7a2c4fd464-goog
> 

