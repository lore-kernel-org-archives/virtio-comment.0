Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 315C21F4276
	for <virtio-comment@lists.linux.dev>; Tue,  3 Dec 2024 15:40:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733240412; cv=none; b=BAkUKgoHR1c1PXVQczeOXScMeezY/mNQ+0uueom1kz4n7NqQ2kVI93BxdSIIzwrgn8rQyOpoZO9uxafwpnNRvGvuSbmtRm6CfO003OE1+FY4RWwqEIot574CSBVci6+A5b74EHoizyRiPjpaJrpGU8EdRtTa4Rp/skWFaWBt6aY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733240412; c=relaxed/simple;
	bh=c4yN+pOJXO8eQfn5AIYnnVvWZKQf14+1b1LaA2aYA+4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=JHsFIcbsAS4ei14gmXEkS7vw7NqVovu4o7epP5R4tMxn+YuyboOPaBoHntLcJPH0DqT8vbJ0MjVhMtjUUMWvVP5kg1LzC8k2Opwyxe460l0OuW7p+pKOhUu8M4pTIffeqNlwhFtkAJpjQvuX7M87sT9rwLCA9HxsgDgjIgihaHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EU0/ZvXZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EU0/ZvXZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733240408;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oZMaxvR+Ro0Pc9FQQsUk7da8m3C0LIO8dxz/We+pmTw=;
	b=EU0/ZvXZbO7k/SPY8pfbMdmdfwWkIRGVg/8zkD7Gg2idA33RoPhciR03r8XJw/5TgdoFBX
	R2nnOw4dMjO1UEv3ptU4nDrzd4GAcnzW/MgZdH01ArWGvplCbK5nJUBVIAt1BilVf+L94U
	7UhLlIw9mAq7Q1CdL5In8El/xgF1AVE=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-UhITatcENguPvJDjpboipA-1; Tue, 03 Dec 2024 10:40:07 -0500
X-MC-Unique: UhITatcENguPvJDjpboipA-1
X-Mimecast-MFC-AGG-ID: UhITatcENguPvJDjpboipA
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4667c1c3181so95211581cf.0
        for <virtio-comment@lists.linux.dev>; Tue, 03 Dec 2024 07:40:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733240407; x=1733845207;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oZMaxvR+Ro0Pc9FQQsUk7da8m3C0LIO8dxz/We+pmTw=;
        b=d8+o4pEUX0OIRBPfzqjhbiIgmlogz1rCCnbARF3OyV5RLyHkxjPW1CxHXnsahctkmh
         eKybbhCdXS0A9+KGdDprDGG4Z2xLmNl/EfylgLRUwCw8T4hUhjwXvsUNUqU8iNumJ4It
         bulo/7IzbxdeTMR/l1Z4LknYalSkspSAqL6ioQSXwyw8zZ/0BgfXrBVp8UO6Eo3fkEAM
         RW9PXbljdRZ2Bxn6am06+dbVveZHyiCYduwjoGkcvEBVnkwaC9nNFA6RORkKmQ7/XSwA
         aUTVadKAu6cb3EecvYfOr0mbSjEDGV72+uZnDAU1n8mZV961uie5sd5cbyIOXyb+DByD
         wSsw==
X-Gm-Message-State: AOJu0YwKmQKDr1ArTG2Tha6x2K4OqPPVOEDf7tOtDmSQzQRwZCcBLx6y
	JDwtLEGEQzjx8ncgBlQXlNockbB5LRdPp3tWZdzmn1ao5prZu59qwMvAkTKvULR7pgEbg11TxGB
	3SSYbaoCVyiJjbfqsWSQuLNaGeDDj0olL0hktamfR4fp1RwkT77rgJO4GrO4NNxYo
X-Gm-Gg: ASbGncu/ypaEWnb/wxGTqm0DExl5WtA97dSZahAKIkFgb1oPvZemuTWBK7lClW6c1QV
	G2wmOATlJ++iLwGY1ixjnE1XimcW0wm66NS5R/fTbY7ilLhy+064MpEO9wjLa+UTAL7IBiIkXMS
	jirfUgsJaUpeyLck4Jq/tfuS0r3Vamz4zA5NZ0JpAdVz+Vea70XaDL/LkxkHsFwnWZ2jlivjFvI
	KpnFZvm/tHNhji4luIVh9ZU76KqX2vhlIYPDGWFdQ==
X-Received: by 2002:a05:622a:88:b0:466:97cc:9334 with SMTP id d75a77b69052e-4670c0e9fcbmr31365091cf.5.1733240407239;
        Tue, 03 Dec 2024 07:40:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg0pWmom0KvuE3LkYxeOPswEg59/+lTWg8rXyy0j3OXIgP3qNcPyxGIWKLi2vYZA8ps3IPGg==
X-Received: by 2002:a05:622a:88:b0:466:97cc:9334 with SMTP id d75a77b69052e-4670c0e9fcbmr31364851cf.5.1733240406896;
        Tue, 03 Dec 2024 07:40:06 -0800 (PST)
Received: from fedora ([185.144.25.50])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-466c425353esm62445251cf.76.2024.12.03.07.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Dec 2024 07:40:06 -0800 (PST)
Date: Tue, 3 Dec 2024 16:40:03 +0100
From: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
To: Aiswarya Cyriac <quic_acyriac@quicinc.com>
Cc: virtio-comment@lists.linux.dev, quic_tsoni@quicinc.com,
	quic_svaddagi@quicinc.com
Subject: Re: [PATCH] Reserve device ID 49 for Virtio USB controller device
Message-ID: <Z08mUxvw4pWwa+eb@fedora>
References: <20241129111325.952-1-quic_acyriac@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241129111325.952-1-quic_acyriac@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: h8Cc3GgHgwEsRJrhGehhK_eHxzZyLtMdx-ZoehTjgBk_1733240407
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Nov 29, 2024 at 12:13:25PM +0100, Aiswarya Cyriac wrote:
> Virtio USB controller device is a dual role device, which
> can function as a USB host controller or a USB device
> controller or support both roles. Additionally, device provides
> support for switching of roles between USB host and device.
> 
> Signed-off-by: Aiswarya Cyriac <quic_acyriac@quicinc.com>
> ---
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index c17ffa6..3c687ed 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -739,6 +739,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  45         &   SPI master \\
>  \hline
> +49         &   USB controller \\
> +\hline
>  \end{tabular}
>  
>  Some of the devices above are unspecified by this document,

Reviewed-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>

Matias

