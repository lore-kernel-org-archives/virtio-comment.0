Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792611700;
	b=iI+vgrzOBoA22QpNoGjhjRTq/6UkgdvW22SXjQ1ZwGlywjcwIO97xrC2XnJ7+2ckansQ
	 RIo6A7kchEg8sfsXSuFlRavGoU6CadaY3ab4K+D4BJHBV8VcfZ1ByKIFGrg6JTayd0sV8
	 xIeUMds6ueLCIk/zeKezzBJzdHmHfh98xsuqTyvxE0XD5dL6TlfaneMV9wpGqAfezT51g
	 yk9OUXvfSNceL5eSpV8XZoCYX5ePdbj08HBQ4EjTLiSGQTMfsokVUmj4N1wft0P83medi
	 AK2WpnNQv1OdHP/QEecYleyOzz5wKnY2tXX8++E9IBhMawEsvpuxkjFi9IH6hcr1ORA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792611700;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:In-Reply-To:
	 X-Mimecast-Spam-Score:X-Mimecast-MFC-PROC-ID:X-Mimecast-Originator:
	 Content-Type:Content-Disposition;
	bh=fET7ABh8DxU0K65QA3i8E6Ktjfd/dJzP1kZDeiiS89I=;
	b=xk8Pq4a2sbcc7YLBjM+uA6LqMPMpi8NCu5h7B8HPehzDq3x3Cc5hvHik7tLpOgTt6/Pf
	 MhssFbLq0AP4MKjHhmMh1rk+4CP+EcckqgrbQkWprPOrWO8/3z0WK/HwfHHVvz6l387KE
	 aAVxVJycji0bNoKClTWj5b/IfGCtgLZBvv9j2+sZJ9GntRF1h2eJ4wCCYcHf3McwVHeAO
	 aa9EpcB8fx8F8IMBp2jbO6Wg3Pua9dBZy65obCz9HXJyp/tQ+uQAdwKrKMMDOPRG1aFQG
	 XdgKRCX6y70kKaw12MipXoF3Ef54Pk9HIZoPlUoU1HljE4uFfkwVtSdAPb+wMFFJtAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HHaIlwAJ;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD06C606A319
	for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 19:41:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD06C606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=HHaIlwAJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792611698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=fET7ABh8DxU0K65QA3i8E6Ktjfd/dJzP1kZDeiiS89I=;
	b=HHaIlwAJd6l8p1SKgCty/03wplPNYDp6uys4YhDZ4jWnl5vJxSFiqybdCmvNZPvw4OfStr
	CQblz+hZ9XKx6rA0F7OjLrNaYq5YwqDl7a2erm6ddUJo+6w5qGb22RKcjLP6YRNnSzcjrC
	sVg3dOXKMd5bpM7YbGVJ1G5/iXVXRQk=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-98-h8BBUiT8PKuQza85fgwAhA-1; Wed, 21 Oct 2026 15:41:30 -0400
X-MC-Unique: h8BBUiT8PKuQza85fgwAhA-1
X-Mimecast-MFC-AGG-ID: h8BBUiT8PKuQza85fgwAhA_1792611689
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48af4046a3bso999770f8f.2
        for <virtio-comment@lists.linux.dev>; Wed, 21 Oct 2026 12:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792611689; x=1793216489;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fET7ABh8DxU0K65QA3i8E6Ktjfd/dJzP1kZDeiiS89I=;
        b=eiDWgrkwfeGoZbxXJ4smjxW0s6v7tyUKgISbggL/0CcncKY81zfclWM90xpwjN9CAx
         JDipFORn2g3Falr3bLZFUkccWDOzrbTZry7tSTMsOWGFrenfLUjAn7vKh/0MEWlBLxKK
         CbxU8RSUz5EVzos8vEzZaHsG38Lz53ZPJZe1U1cq25UCQvrR0/ssCqaVyRmP1gS2BsD1
         4JSmFccaqZbfkIC89ydMK+h48nOWZLLxQyPVpSbxuZ7DvaNazIDBoyRiZ1k5bsv70ESb
         zTVHGjrE9WlYji8qfkJsNu/HaV1Y7sOiXnh5qm6wlY0aRP7KgMCHaLSjqrAK9NiV2UNA
         zKPQ==
X-Gm-Message-State: AFq9FYLA5mfS5ndupJGRdDf8M/h+OJnSDwtq2lvTCTpPNIWMcCmmSvPO
	QLQeoCBsxAdJOGLPQmGLm1KpPw4/bXueoyN8qHmUHcPd2M2Dz+SgnUwc/RRo9Pi9UtNzSCy2Jaq
	gm2GimiFz7q5tmutu3DxLyxG1xh5yN70QN0Stm3Y0G7HScbUnR2OmlhhvCF6BWboXmAly
X-Gm-Gg: AYBFou3JM5D4Chs/6ak4H2rPrJg5tOQf/9gl/vkECmewBuWhpdo7x3f9HINzOnrk0BB
	JjSD65ClxlyaU6oPZ8Cc+DWc9IEOL5xSnwXY9C3M6nVc7awUUPG5cVMIxMrogePUNzfPkhv1RVG
	KV6Do4cxSReUeJbLZKwzPS0EtuaJP3WHwDsrVN7WgMgOPhkmqwV4lW9XkAhrwrb4ZFFbYJ4G0wq
	kvFff1nskw7/9ualEC0MIYerparqHlsia/cpsOTslZ6Ym0boMOnZm9TJSJ2iYtbHyTjqhwD/Oin
	yjLt0P/EIosSILKEeCvf0aubJAXKy2rOEiefvgWkLyvtWcZJe6LgYXvuQrr5yH+4GGA=
X-Received: by 2002:a05:6000:2997:10b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48e264c9548mr4897430f8f.37.1792611689089;
        Wed, 21 Oct 2026 12:41:29 -0700 (PDT)
X-Received: by 2002:a05:6000:2997:10b0:48d:ba3b:af36 with SMTP id ffacd0b85a97d-48e264c9548mr4897387f8f.37.1792611688514;
        Wed, 21 Oct 2026 12:41:28 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1536:fc00:b838:383:1c7:6e81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e2581f0e2sm6839395f8f.15.2026.10.21.12.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 12:41:27 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:41:25 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Peter Hilber <peter.hilber@oss.qualcomm.com>
Cc: virtio-comment@lists.linux.dev, Jan Kiszka <jan.kiszka@siemens.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Trilok Soni <trilok.soni@oss.qualcomm.com>
Subject: Re: [PATCH v2] content: Reserve ID 52 for QPSFI device
Message-ID: <20261021154020-mutt-send-email-mst@kernel.org>
References: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Post: <mailto:virtio-comment@lists.linux.dev>
List-Help: <mailto:virtio-comment+help@lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
List-Owner: <mailto:virtio-comment+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
In-Reply-To: <20261021180031.7175-1-peter.hilber@oss.qualcomm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gUUpeSpszzr7v3LsKQNB3iPO22RnJ3TN4KBbJsV6wb0_1792611689
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Oct 21, 2026 at 08:00:31PM +0200, Peter Hilber wrote:
> Reserve a device ID for QPSFI devices (Qualcomm Platform Subsystem
> Firmware Interface). QPSFI devices expose functionality across SoC
> subsystems through a common Virtio-based protocol. There are no plans to
> standardize the devices.
> 
> The Linux DCP display driver series is planned as the first user of this
> device ID:
> 
> https://lore.kernel.org/all/20261015-jshekhar-drm-msm-dcp-v1-v1-10-48aad0fe4f72@oss.qualcomm.com/
> 
> Device ID 51 is already reserved for the Virtio HAB device:
> 
> https://lore.kernel.org/virtio-comment/20260702140939.3535968-1-zeloren@qti.qualcomm.com/
> 
> Signed-off-by: Peter Hilber <peter.hilber@oss.qualcomm.com>

What about the HAB btw? It was said the spec will be upstreamed
did I miss that?

> ---
> 
>     v2:
>     
>     - Rename the device from "Snapdragon device" to "QPSFI device".
>     
>     - Refer to DCP Linux driver patch as planned first QPSFI user.
>     
>     v1:
>     
>     - Was posted as "content: Reserve ID 52 for Snapdragon device":
>     
>       https://lore.kernel.org/virtio-comment/20260826115504.1955-1-peter.hilber@oss.qualcomm.com/
> 
>  content.tex | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/content.tex b/content.tex
> index 243ce2dde36b..7416939e67d3 100644
> --- a/content.tex
> +++ b/content.tex
> @@ -805,6 +805,8 @@ \chapter{Device Types}\label{sec:Device Types}
>  \hline
>  50         &   Video encoder/decoder device \\
>  \hline
> +52         &   QPSFI device \\
> +\hline
>  \end{longtable}
>  
>  Some of the devices above are unspecified by this document,
> -- 
> 2.43.0

