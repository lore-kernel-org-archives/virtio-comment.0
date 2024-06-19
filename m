Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F30CE78C6D
	for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 08:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718785488; cv=none; b=Mw2c4qaF8IVerF/5yETzERwWs+jA3CAbpoQv9dpbQ5FbVCdSPkrozb7XbLzudc5unOD8NqBwJd9fANdieP5/8SWOarZZ5FhJf3RzguAO2wbfkwgDP9EAie8PZ8WMe122caA06Gs5AK3tLbTorhUdkYCXcxkutPM2J9zoKoZc2MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718785488; c=relaxed/simple;
	bh=xFtHopRSBKF+mWBXW5EZdnv6pc3JiCSkii6ZPbrblpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=ch6zOwbvBa/jQbQcIYa7n6u2UjC+oA2ujv2tSUZlIXeSjV93Z2c4ed0uX302ecFzCCV2Fdw7/akcZozcJbtcwH/7Fexeq7xV21+qjbNqYI9aW19aM+uCVh/Fk+xHtIbKdELrXOLSvn50rXWD3KNyJ1TTrA0y/va9Yl7zJC7toPk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UGi+zdbC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UGi+zdbC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718785485;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=vwpRQbjKiJCMObGLdrZH7ncy6jTaPDCe7v09s1XHQno=;
	b=UGi+zdbC6wgV/u1rRVt5RyObQXsaYqufo0eZYEzTRBJtjkKtmZfzXcx3uTF3zJzYyCW99F
	EOcfuC9NdewnUz6lqSbl7+QTXDUPGKGKInh7aKB8Otxkyhvt6l1pe/8oz4hDXLSIqOhTMl
	g0wRQnfFdnuVURBXL526tajp0KYTVDY=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-422-J7Ae44o-OZC6dRh5uNTjHQ-1; Wed, 19 Jun 2024 04:24:44 -0400
X-MC-Unique: J7Ae44o-OZC6dRh5uNTjHQ-1
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-797d167a4d1so722628485a.0
        for <virtio-comment@lists.linux.dev>; Wed, 19 Jun 2024 01:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718785484; x=1719390284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vwpRQbjKiJCMObGLdrZH7ncy6jTaPDCe7v09s1XHQno=;
        b=tvlBHI00M2mKppmAj48OS31Pbl/KPS4yaxINpljuNlPjXJVYqP0hlT+YBYjldFb/i0
         RpXMmhGOGhGYkcCYArG2wfsWCSBpel2woesVO5oF5yuobaFDOhAOeufnHMbK68LClV5Z
         OwM/lWHK9TeYFiSOmhc190ZYpEJKEE81skwTuvoLyoUy8qv0APqix2Au1/+uNqKjJzO/
         5xy/Hv4LZv73huzk6bFm2MehvyUlK3DT4JUQj+OW5LpDZcD7uEPQbsMQZH1WgoojZF+j
         8sLH3nE82bqTFBSGWKW7hL3/FBg/81/q3jl2XcwqFMffrBPe7X/4e4yR95iIwM0LEUh9
         HBxA==
X-Gm-Message-State: AOJu0YxNp4h5C+cB1+I2bNC2E+uQUDOfoiDVUx43K9RqWDPMZ54KCdzw
	EODeE+GppwReO3OGOFb1T8IojU5ym9a/iDg4aEXDnqC94ceuMYOwwWpXI/xFJ5h0tWD8NsRrr1i
	euBw7ovJnhRyGWcPvptoNrSWR9B0MbXO2HhcDXpNEyfhu/M6niH2ionfYHZf7odzG
X-Received: by 2002:a05:620a:2442:b0:795:5251:8e25 with SMTP id af79cd13be357-79bb3ee58d5mr206184585a.65.1718785484037;
        Wed, 19 Jun 2024 01:24:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHWoKnhLiVltEp9+VYfb0LHXmvOaMTrm/Swkxy4TPaeJK/qLLZwhazhGlDEhF2sq8ZhM3Qoyw==
X-Received: by 2002:a05:620a:2442:b0:795:5251:8e25 with SMTP id af79cd13be357-79bb3ee58d5mr206183085a.65.1718785483565;
        Wed, 19 Jun 2024 01:24:43 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.183.156])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79bbb511db8sm18900785a.57.2024.06.19.01.24.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jun 2024 01:24:42 -0700 (PDT)
Date: Wed, 19 Jun 2024 10:24:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, harald.mommer@opensynergy.com
Subject: Re: [PATCH v1] virtio-can: rephrase notification mechanism
Message-ID: <ehukxxxkyd4dhxd7vzeelol4mz2bi4sq2btukvozcsygf5zbzv@wh3cnvt7756o>
References: <ZmsXXumHlQXnU2Wm@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZmsXXumHlQXnU2Wm@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Thu, Jun 13, 2024 at 05:59:26PM GMT, Matias Ezequiel Vara Larsen wrote:
>Rephrase when the device may omit to notify the driver due to a status
>change in a more straight-forward way.
>
>Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>---
>* This patch applies on top of virtio-1.4, which has not been released
>  yet.
>
>v0 -> v1:
>    * Rephrase commit message
>---
> device-types/can/description.tex | 13 ++++++-------
> 1 file changed, 6 insertions(+), 7 deletions(-)

LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/device-types/can/description.tex b/device-types/can/description.tex
>index 2511d9c..b13da9c 100644
>--- a/device-types/can/description.tex
>+++ b/device-types/can/description.tex
>@@ -128,13 +128,12 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
> \end{lstlisting}
>
> If the transition succeeded the \field{result} is VIRTIO_CAN_RESULT_OK
>-otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is
>-necessary, the device updates the configuration \field{status} before
>-marking the request used. As the configuration \field{status} change is
>-caused by a request from the driver the device is allowed to omit the
>-configuration change notification here. The device marks the request
>-used when the CAN controller has finalized the transition to the
>-requested controller mode.
>+otherwise it is VIRTIO_CAN_RESULT_NOT_OK. If a status update is necessary, the
>+device updates the configuration \field{status} before marking the request
>+used. The device may omit the configuration change notification when the
>+configuration \field{status} change is requested by the driver. The device
>+marks the request used when the CAN controller has finalized the transition to
>+the requested controller mode.
>
> On transition to the STOPPED state the device cancels all CAN messages
> already pending for transmission and marks them as used with
>
>base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2
>-- 
>2.42.0
>

