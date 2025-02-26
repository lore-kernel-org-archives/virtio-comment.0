Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7070137E
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 10:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740567565; cv=pass; b=X3YdB/TGxrOGd7hYBipvDp6HDyAWR/iL/HXnn5p2laJtpv1r0raFs/gn5WIak013dIFl8fJFNZWXOjua5O6lnuyoj/syVgU59n8dKmxnhdjxZ3v5lwYSgrstodvnzWZCevQrYBR4FwSkEEhpjMd1dqJqXMowfcDn/5YdnS2Isvk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740567565; c=relaxed/simple;
	bh=X7jfuMgAarI2R1XFEqioXUugNdfrA3ElV7TyaAEbKzY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=Bje6dSA8CyupCiuNFZ5FIcJOK0y9Hh6Jr7aCX2DOjkt9s5iIx/IhZBVvNP/wDCrPO7jDbd8f5ByxlGLJt4GOn/GDri0+j9rcaNDI9a3eYjwwZQrjoliN5rECoAaHf40MG0EeCpPx5UEHuu5mJInj/SFR5/iZNvrQmlNr/kdams8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=XAFKFZGZ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="XAFKFZGZ"
ARC-Seal: i=1; a=rsa-sha256; t=1740567554; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=UUGcdbjgdkZ91lncinD5U5hVd0MQk7KcWcA85BkIWNQg5u9OG10FCB6HDd2lwUKet8l1GaEEiyLLf8+QwQ3Ndjo9QwecTriWs8j8n6JmqFa0E8DxKGk16cVtjUBrAX+/frTPk7kQEKAhwYLWA2L5NwGFkWQ42svNjZIfV/DuckM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740567554; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=AsNMbHZ/Hyy5Cv/7d2T9n4v9UAbKCsKpNexJkB7PqEg=; 
	b=Vf7Mqy10RzGH4XqwvsLgomV2U8gStqWNg54rIaCFV0FOjhZboWCUm4pt5F/bPHzYq1WsHqrUAZXMxsFfWogK79d4ZVqM076cBffdCUJhCgO7JC55CpF/S/kgjbJe12G01awWV3jGR6sGIZ8cy0YSkHS1f1XgvppjVDd84nJtrqI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740567554;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:From:From:To:To:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=AsNMbHZ/Hyy5Cv/7d2T9n4v9UAbKCsKpNexJkB7PqEg=;
	b=XAFKFZGZIaa+Yke2s0PSmGbhSm5zIRzp/EHc9LgNoDbqPaQCz6SeHhhjxWnTXtAx
	KKFLXIP6rB5rZ3hRyG2vZGbLO4N4Ll7GEVhYpHFTK0aGxt/AQ+SXSFRdzCQopl7XZg2
	yur+ARaLfhx/4wf+Vd7mFS0Fk1lEwiJexmlKXipI=
Received: by mx.zohomail.com with SMTPS id 1740567551873493.9576012227186;
	Wed, 26 Feb 2025 02:59:11 -0800 (PST)
Message-ID: <de02684a-8f36-48ba-b505-85b6d74f5e8b@collabora.com>
Date: Wed, 26 Feb 2025 13:59:06 +0300
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] VirtIO-GPU spec improvements
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
To: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Sergio Lopez <slp@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 virtio-comment@lists.linux.dev, "Michael S . Tsirkin" <mst@redhat.com>
References: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 7/19/24 15:06, Dmitry Osipenko wrote:
> Hi,
> 
> This is a repost of v2 to the new virtio-comment mailing list.
> Michael Tsirkin suggested to repost the patches, here they are.
> 
> Dmitry Osipenko (3):
>   virtio-gpu: Rename GFXSTREAM context capset to GFXSTREAM_VULKAN
>   virtio-gpu: Document VIRTIO_GPU_CAPSET_DRM
>   virtio-gpu: Update venus-protocol URL
> 
>  device-types/gpu/description.tex | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/182

-- 
Best regards,
Dmitry
