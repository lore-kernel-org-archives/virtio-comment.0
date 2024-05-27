Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D824715E96
	for <virtio-comment@lists.linux.dev>; Mon, 27 May 2024 06:41:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716792086; cv=none; b=GBEI31jalrPKI8DhLCauKv3IXt+1Q3zdfLrVeoxFXnspgT074QRv26O5Fi1jrj2+uP/Z9ejbSpueZgNdKR8Pk2tK3XNkoNXxLRhJWYt/QALTV1v5nSRx6NKkjl+FS6n6EB7G7WCnwxR7mAwrL7KOhBZxTyIIiXzgej4qtMJ9Ei0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716792086; c=relaxed/simple;
	bh=xGgfKTumJCAzyqqV3d2z3/QvdVGnZyfgZdQbXrtZtJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=WEcavECm0FocnWMFgxiFgbQk9arsuozNRyOMa92/OSN6yMnB6CcgM0gSu/tf27shWR26y9N2XHk+4+nFKdNHjydYGupiFnQI5LM5syM2eEIUIsL6ltdNzYTBE2CH9rssmX7b/B31kA0M0E36L60xYTzQnb+wgrHLrfl1oJ124Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YLgtNv6f; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YLgtNv6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716792083;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c90bN4bCmxJ96CLf78qxhzeX4X46ooVNld3WbAEMBe4=;
	b=YLgtNv6fmtZ7osw/n0+VkOrQJNuxUH6IcwgjIGBLa06csMfvcLMbFMbmXI6hMuLv+bMOmZ
	mfyCYhP7cma2ob2Um2pnPyE0H2V5cgkDEPVpEP1CJkaMEFNsiKLft02mKZadb0bnYNETKy
	b+NLlC/gO/AckuqomiU3bAJhqwKwtlU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-228-78Mi9gQjM-6cUtb4qAuong-1; Mon, 27 May 2024 02:41:19 -0400
X-MC-Unique: 78Mi9gQjM-6cUtb4qAuong-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-35858762c31so206441f8f.0
        for <virtio-comment@lists.linux.dev>; Sun, 26 May 2024 23:41:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716792078; x=1717396878;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c90bN4bCmxJ96CLf78qxhzeX4X46ooVNld3WbAEMBe4=;
        b=UESa4mMy1oZmhV0THHhR/Ao3JnWK5tKwh05USGgd41JrflfzaB1MgELDCCD+xPeMQc
         4jVDM6A1fiGBDTNloIzw1+lKPix8PSUwOOBo4L2uy7i0Cp37V8/xHy/+ZoC3c88iZSm+
         K7CVrxer/1+uDPFTgsqt+Ey64xIOo0HHJX7gqmcD99C0XDhAXPwShz3Qrx0uM+Dp7KOI
         FJW8qHjvnrAIzC8KdgW5HiTYERzSCWy10cAwOoflcRQh58mje3e/Tr6ay1O+bE0cMZau
         byx1AjqhYH3DBr09RKP7DPNnCMzsUNih86MFeZm4b39xtwp4Dot37O3Gw7DOCGF7Zd7F
         cdKA==
X-Gm-Message-State: AOJu0YyX+B9hXgB9PZo3dSBJgg38Z7ASXDq5/HT2kfoCwV4QiJheSD1e
	HmpJkpNJjR6rc46Wd4EOsdPvvrQ7JtJjalj4ZR5w2waSIF4c0VD2bRKYR+N2daoFcXkeo8lcNW0
	eyG9OWUXtekSZ5fr2ZO8vLEOa4T/zCxUVSEen4dp3AM5ldlMkxefEukCUgGmCfGIG
X-Received: by 2002:a5d:47ab:0:b0:357:a6e3:8748 with SMTP id ffacd0b85a97d-357a6e3877emr3990067f8f.1.1716792078532;
        Sun, 26 May 2024 23:41:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjtA9kIKx226xQdS/ugV2TUje3Mhx+t2f7c11epYaY2oJwBLNV/841RG7a1zvfu7H3ER9HDw==
X-Received: by 2002:a5d:47ab:0:b0:357:a6e3:8748 with SMTP id ffacd0b85a97d-357a6e3877emr3990043f8f.1.1716792077954;
        Sun, 26 May 2024 23:41:17 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc7:342:cd82:9c62:7faf:9d73:ba3f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3557a090805sm7997202f8f.48.2024.05.26.23.41.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 May 2024 23:41:17 -0700 (PDT)
Date: Mon, 27 May 2024 02:41:14 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: zhenwei pi <pizhenwei@bytedance.com>
Cc: virtio-comment@lists.linux.dev, virtio-dev@lists.linux.dev,
	david@redhat.com
Subject: Re: [PATCH 0/1] balloon: introduce 6 memory statistics
Message-ID: <20240527023734-mutt-send-email-mst@kernel.org>
References: <20240513121005.459013-1-pizhenwei@bytedance.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240513121005.459013-1-pizhenwei@bytedance.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 13, 2024 at 08:10:04PM +0800, zhenwei pi wrote:
> Hi,
> 
> There is a previous discussion about the new memory statistics:
> https://lore.kernel.org/linux-kernel/20240423034109.1552866-1-pizhenwei@bytedance.com/T/

> This may be helpful to describe the usage of these counters.

It's ok to add a link but you really should include the
motivation with the patch, and preferably in the commit log
not the cover letter.


I think the qemu patches actually include a lot of good info
about the statistics collected. But they also raise a lot
of questions that would be of interest to the TC.



> 
> zhenwei pi (1):
>   balloon: introduce 6 memory statistics
> 
>  device-types/balloon/description.tex | 24 ++++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> -- 
> 2.34.1
> 

