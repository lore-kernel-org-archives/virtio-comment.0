Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198DA21770B
	for <virtio-comment@lists.linux.dev>; Thu,  3 Jul 2025 08:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751529715; cv=none; b=ZXFZU425zxpmnpmWzQIef12bfLfmPp5kjS4AaWA4b1JOrenTnS9jrlTv4J8xeU1eCCpHmybz1oXr4xB7W26rroOcoRTUNAsnAt/8XXKMr7Z4m3pK8ZqE0lX97CVDIKiD3gk8KXAbMeceTjjFGkV/d7NE+hz3yiqprbx9XP5iUww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751529715; c=relaxed/simple;
	bh=oo0tGGzJYHa+6fqqKbmcIXtQ1KyOKqhB5ZNo5lKNbRY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=sCq7w76O3GQquqq7HbLX9TRBUZbjwifziWcEzYSscszUyyNhlyyIpWmniwnITwO0+lEsmvA6U4PEIqaxj+PfkS+SbRhPyQQ5+JkiG4kmJQ8p2m5dMvm/w8nsLt+NHNR8MA738sQwNDHR774jocEglV0NbraDleXyQm93cc0S/BU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VC2qPJqU; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VC2qPJqU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751529712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1WfIt9FPYirQNmFy3W5VAI0udhY5IUbfTX+a/zkOITk=;
	b=VC2qPJqU/x8mHPLpsAZSQfj2q7AnCC56QrHj194pFPVfhlaDBXoDxzcFg27lS7MXxcbWF3
	JzvQbqYyH0bkeixZvJUdqN/7Fj5+RV3wHM6lRYBv0kOSYaOETNR18H8VFIGKEB88xM4A9H
	3+IGQciwoTkNYOgSWrR+q6nQG5xXBn8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-394-4Q7RaNrBMAa7rHgfZBKpMw-1; Thu, 03 Jul 2025 04:01:50 -0400
X-MC-Unique: 4Q7RaNrBMAa7rHgfZBKpMw-1
X-Mimecast-MFC-AGG-ID: 4Q7RaNrBMAa7rHgfZBKpMw_1751529709
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a5780e8137so319778f8f.1
        for <virtio-comment@lists.linux.dev>; Thu, 03 Jul 2025 01:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751529709; x=1752134509;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1WfIt9FPYirQNmFy3W5VAI0udhY5IUbfTX+a/zkOITk=;
        b=VJyvDJRskrjwpHJDEvQCUVHAE/EwF8ltPThUc207ZOOi6u3YfAJB+tU+eOqhDDbw4V
         b2hGxFsq1bomG6AJL57UNT7tZOnpFxqqGrKfbePOMll3AnlUh8oswb1KipoKLTC5jlo5
         e6NzMUYVyB5uSqQXXGy6o97VR/K8y7wRkGODg2i/r4n9/Wefj5EEVaE6ZZKsoVAalQd8
         sIu8A8yVpKpjbF5AJsuu7HEtbzx7PQj3AkpjuR2NANhioteFkquJsbv/cUqHLzXTkKz8
         8td9grGqpWyg2i83wWmQVittSMx/pxF0P3ChptKZL1WtgE8pXuzQA9vPSlzB0c7VBKRM
         OHBw==
X-Forwarded-Encrypted: i=1; AJvYcCWzdvQpPa7zC2w9CovV0Fl/u6HKDMbgSP1WF/lbfFH1HngZELegiSeqZYMk0ioVWUA2dFxrhUrwQITfNXwRbg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywpz8U4UrZ0F/OhkhRjIA+X1XZEartC329wJh69h6h9BbRWQRnw
	yZWoPMNbRrmb2dB5Jcb/p4Ks2Z56htk22wEzvGp1oE0GKKIJxjomotY/ku228+ono0dOE6JHo48
	vZ/0PF+2BAVaFc59rA4K0RjWE8UHJox4UwUdmYRkEqjYZL+pAh0KXlmlgwNCZd9gT20D/
X-Gm-Gg: ASbGncu30K6+vddZXBUfPwMPNxh61YX0J5soaTK8gwd32u/CrLs2ANo1KfXr7+NUSet
	SLBT4CXjJblRZRYKUwb5TUHd7mEao64FQ+3hjQ3qGdmILdFw3c/EnNJY47fkOVK8UfTEvRq13mq
	uqcEkeJKu1yW1GhIbPowSIf7VyUFLlL4cVTDEBPHjCO03r3AEr51cKaQ9J5VZpG9pNq8UlGAVAB
	5Fmd3jmeCN9+16Am9j5HlVX75ZMgSN8OgZdg3enSupPFITCVH9N3ryz9YaE7T7sDRCZQj8pwMvf
	6vrPPlIQm+hm/JXP
X-Received: by 2002:a05:6000:2dc7:b0:3a4:ce5c:5e8d with SMTP id ffacd0b85a97d-3b3449deebamr1527627f8f.20.1751529708982;
        Thu, 03 Jul 2025 01:01:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFRgBakuyCgpSADicfTiIOYWDmkr0ux9S3lUVi0fR50JzbfN3VEEeyv4l75VWTlJE5yjLIVAw==
X-Received: by 2002:a05:6000:2dc7:b0:3a4:ce5c:5e8d with SMTP id ffacd0b85a97d-3b3449deebamr1527580f8f.20.1751529708439;
        Thu, 03 Jul 2025 01:01:48 -0700 (PDT)
Received: from fedora ([2a01:e0a:257:8c60:80f1:cdf8:48d0:b0a1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997926csm19026705e9.15.2025.07.03.01.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 01:01:48 -0700 (PDT)
Date: Thu, 3 Jul 2025 10:01:46 +0200
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Zhu Lingshan <lingshan.zhu@amd.com>
Cc: mst@redhat.com, cohuck@redhat.com, jasowang@redhat.com,
	virtio-comment@lists.linux.dev, Ray.Huang@amd.com,
	Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v4 1/3] virtio: re-order device status bits
Message-ID: <aGY46ohk966g/EIQ@fedora>
References: <20250702085421.342224-1-lingshan.zhu@amd.com>
 <20250702085421.342224-2-lingshan.zhu@amd.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250702085421.342224-2-lingshan.zhu@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: F4YekcGMIGwjjQiFj6rLG4VPnValWWWBFhWd963F6AU_1751529709
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 02, 2025 at 04:54:19PM +0800, Zhu Lingshan wrote:
> This commit re-arranges the device status bits,
> to list them in ascending order.
> 
> Signed-off-by: Zhu Lingshan <lingshan.zhu@amd.com>
> Reviewed-by: Parav Pandit <parav@nvidia.com>
> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/229
> ---
>  content.tex | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

> diff --git a/content.tex b/content.tex
> index d3fc6a4..1efc2a5 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -36,19 +36,19 @@ \section{\field{Device Status} Field}\label{sec:Basic Facilities of a Virtio Dev
>      this bit.  For example, under Linux, drivers can be loadable modules.
>    \end{note}
>  
> -\item[FAILED (128)] Indicates that something went wrong in the guest,
> -  and it has given up on the device. This could be an internal
> -  error, or the driver didn't like the device for some reason, or
> -  even a fatal error during device operation.
> +\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> +  drive the device.
>  
>  \item[FEATURES_OK (8)] Indicates that the driver has acknowledged all the
>    features it understands, and feature negotiation is complete.
>  
> -\item[DRIVER_OK (4)] Indicates that the driver is set up and ready to
> -  drive the device.
> -
>  \item[DEVICE_NEEDS_RESET (64)] Indicates that the device has experienced
>    an error from which it can't recover.
> +
> +\item[FAILED (128)] Indicates that something went wrong in the guest,
> +  and it has given up on the device. This could be an internal
> +  error, or the driver didn't like the device for some reason, or
> +  even a fatal error during device operation.
>  \end{description}
>  
>  The \field{device status} field starts out as 0, and is reinitialized to 0 by
> -- 
> 2.49.0
> 
> 

