Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.123
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795015242;
	b=3O/LZTXxXdKuW/q+0I8OaM8FU9XqTEtkZ1YN2CvjXoSobWFK7IskJwqhh0oodpYt298t
	 snITUqde2SmPaV7cEUikjtCldRep/1/wTPkL5zl/D3OaGU9x6GDSmXSIaiRPyHPD7wPSK
	 Su3vMQau7eLfC2SPX7DSEiInCNg7zzmL0xnVJlKwG+t4AxxOWOiULaUaMi+daWIg9x50U
	 Ys2YR0Ib6ymo69192VrUQcw+fnDA28oB3dJt9y6JrzkMfs4OU/1nBty/6H9wz9jL2q/zx
	 fxsOwDPVzVzS+p1f3qXlOUV8a1z8Glh4eR2qbvy3uVTmYz3lq33RynAQSDOczWxIgkA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015242;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=55Mu+6naMW0xADAWAPsWVDEbxqUIJtLiv5p9fGBjuLE=;
	b=DY+EN9Okp73w++Zc/6m6rSj512k1wnfwcDtJ8GcjqOsj3kwRG88IkBJMIG5eMg2NLoyi
	 uDimG5EkCJzI8rrXEq0f1Sq5yqXk1glds1pLs36K9m1YnxvOlt8tIVSTLpx1JQ2BBz5Gw
	 KnzsN/wkziehSRc/CmegIcQULlMSNjA+Q+t0nYrM4DtgCxUSWOwfnuxLOiFXpdKgS20+F
	 TMurbugEIBf+s6mBBXR5jItu2HvX6DRVadByv0lqMW0lVGAPXOsX3S5/dDmyjvg3LJl7x
	 O3F7lYSWtS2w/dSfRAkhOnWryG+nX1QOCMz+zyjjErhCaMra+IlX7SKItHbk8D5ZC6A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=K8ti0IQn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.123
Received: from sender5-pp-g123.zoho.com (sender5-pp-g123.zoho.com [165.173.182.123])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1713D60A2609
	for <virtio-comment@lists.linux.dev>; Wed, 18 Nov 2026 15:20:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1713D60A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=K8ti0IQn
ARC-Seal: i=1; a=rsa-sha256; t=1795015236; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=OEiHi6qosz57kum1z4dPIFEfwDyvyx41CPcow6ZKWoFuAzJoM93Hh1zq8r32eVATvn4h4yclfUWc+00oAn8R7bL3Gy3LF+iwZxGcWk7KYF0pGifcaQeU9tg4Zm1Bc7mO8fqYT/ISiSZuqRbGR0mYcCfPeSR9k4QU1qQPR2cGsHI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795015236; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=55Mu+6naMW0xADAWAPsWVDEbxqUIJtLiv5p9fGBjuLE=; 
	b=iKtsIWwZhFjMHs6aWoM1Cu2hZVjHsgg8BtowYWWAidkOtHOf7x1dLRf3t9k3Qj1N2qQFhFWIpxWCESI58KSAhEcenLJLU0d3zOPbXWEPI2bIUo7Ib9JWaPVvof7aQD/vfqXmAS6SODEC9yAQXCWAcvWce1PvrUMO3VyTZBHpN9I=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=K8ti0IQnNeov3S7cOHyukt4pYF9vyhU1+oECq3Q7AF5N9n6YbPVzs/qH/qwDsRmtPyiOebdKVK+C1SioFCw2EfmSTaZxVn0FOdmbkaJOGov3NLXo0Jz7q5iZTDP3N7yBjj2IIYjGfQHRewu6GmfEjLS0J2UD8NelYi8bWxuyrHo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=55Mu+6naMW0xADAWAPsWVDEbxqUIJtLiv5p9fGBjuLE=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795015234215116.60847265177165;
	Wed, 18 Nov 2026 07:20:34 -0800 (PST)
Message-ID: <5fc1fa19-3edb-4149-9a02-7d1c184cdf2c@collabora.com>
Date: Wed, 18 Nov 2026 16:20:31 +0100
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-gpu: Allow num_scanouts = 0 for headless mode
To: Dorinda Bassey <dbassey@redhat.com>, virtio-comment@lists.linux.dev
Cc: sgarzare@redhat.com, aesteve@redhat.com, slp@redhat.com
References: <20261103110623.328004-1-dbassey@redhat.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261103110623.328004-1-dbassey@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Dorinda,

Thanks for the patch!

On 11/3/26 12:06, Dorinda Bassey wrote:
> The specification currently requires num_scanouts minimum value
> of 1, but the Linux kernel has supported num_scanouts = 0 since
> commit 72122c69d71784 ("drm/virtio: Add option to disable KMS
> support", 2023) for headless GPU compute workloads.
> 
> Update Section 5.7.4.1 to allow minimum value 0, aligning the
> specification with existing kernel behavior.
> 
> Signed-off-by: Dorinda Bassey <dbassey@redhat.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  device-types/gpu/description.tex | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index ac3b427..83d2126 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -67,7 +67,8 @@ \subsubsection{Device configuration fields}
>    Writing a '1' into a bit will clear the corresponding bit in
>    \field{events_read}, mimicking write-to-clear behavior.
>  \item[\field{num_scanouts}] specifies the maximum number of scanouts
> -  supported by the device.  Minimum value is 1, maximum value is 16.
> +  supported by the device.  A value of 0 indicates headless mode (no
> +  scanout support).  Minimum value is 0, maximum value is 16.
>  \item[\field{num_capsets}] specifies the maximum number of capability
>    sets supported by the device.  The minimum value is zero.
>  \item[\field{blob_alignment}] specifies the minimal alignment, in bytes,

