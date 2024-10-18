Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32518178389
	for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 07:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729235616; cv=none; b=pkgzLQkGyyBSCR/0l0lxLPuH8lwxJ9/CT+uSTtqCnavijQchDlfJ72+OD1LOBwXBTMhppf+Kyq/XyJbCPMDLkO89q2t3ZmOyx7TCd5fYHLSWB2DFe0nyboFwQXP7F79sxb72RTuaSCQM1yltEVZgpIpa1InNdkBFMc+F9MrGK5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729235616; c=relaxed/simple;
	bh=0q/Id9+E9Y4JHb3dpe42nAs39b/nYsNPcNN7RJ8CpQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=qzwHIhh5zBxLqGTJKEc8z8Kpn4oE4tfR1DD7cDzBDPWw8QS5FMAmp6DrjN29Yzq3lj8NrV7vPcbj0mue9t2g/SXOB89zirtJXSQO/osRc2+FHNJEuBcwKKDamyEf1BiESfv2ZNjq2ZugLUzXM0Gb/TIAmqE55S9fW8qGArr8YvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RWZCwANj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RWZCwANj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729235612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=FMncr0oWa0WiAFCPVbDmLHxvGCYPvkHE3qBF9Igj/9Y=;
	b=RWZCwANjBpyt4F8JkYnPqaaNTY/FbEolVzhmk+tgPJXqguHJrCem9RzD1qS/usJnOmCnn1
	cs4RXKug6nldEMRK2WzQLOf6hnBjZab7NBbGkNNuSI88fuMCiUPqCgkUpfydy2rnG9zGb2
	dBEPY/OtvFX4poEIKON2mlEDTs541ac=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-F6OTBU77P_e-j3XwU7FG2A-1; Fri, 18 Oct 2024 03:13:31 -0400
X-MC-Unique: F6OTBU77P_e-j3XwU7FG2A-1
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7afc3f4faaaso322996085a.0
        for <virtio-comment@lists.linux.dev>; Fri, 18 Oct 2024 00:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729235611; x=1729840411;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FMncr0oWa0WiAFCPVbDmLHxvGCYPvkHE3qBF9Igj/9Y=;
        b=bH+73/4hX/FZR3sYvGYCGdto7Eqrv8cvxpCf9ckOOH9l6WEtYCBc0O7aCyRjieLJL/
         4PGFlkmRRyRRH3s66qdlnERWdflfshbZWl4P9/kCXTNvUJSF+On8ef4VV7gco8TIefP7
         aE8qO7RCJoIjOpZJb71GUcjp61acjH4Iv2zZDE7us7rpx6R7IZXqwel+gj4VvkZrJsES
         EOT2EwCwA2fqkYX9ydB1KOJcigKg0eU0gMXRXkyIcj384RVRfmyxtseSfKQMmZ2ce0xB
         lWrv/Qz0pRJe/YXLZdYPz4xIMKfBZNmGDIh+uCwTUyTVTmGMOtnHQPckcYnSLkoa9Cmy
         wLIg==
X-Gm-Message-State: AOJu0YwSI38u2NRd38oufHg994YjAJiHN7C0n9+LTfVwyyN5CsFQboqA
	ADgydPkbxsG56zJsmxMAEwNE71aMo+Pdxo/MFBeARFSewvE7u+79n0msvh6GQiWdn07Aa+M0qkH
	IV0z+rl2PrKZGNdR8hn2tu8lOueINoqnX9TZnIG8tpa/PJP6RG7lsZSIbkugLgR4i
X-Received: by 2002:a05:620a:4054:b0:7a7:dd3a:a699 with SMTP id af79cd13be357-7b157b453e5mr122659685a.11.1729235610995;
        Fri, 18 Oct 2024 00:13:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZKa+2JcmCbFx/MRjzsLQSwqZpUtTCb1AbgHxd+kfHdYnP76whCa+cWu0jhrNEn+2qxy5r5A==
X-Received: by 2002:a05:620a:4054:b0:7a7:dd3a:a699 with SMTP id af79cd13be357-7b157b453e5mr122657785a.11.1729235610568;
        Fri, 18 Oct 2024 00:13:30 -0700 (PDT)
Received: from sgarzare-redhat (host-79-46-200-231.retail.telecomitalia.it. [79.46.200.231])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b156fe5b1csm45096185a.87.2024.10.18.00.13.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 00:13:29 -0700 (PDT)
Date: Fri, 18 Oct 2024 09:13:23 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Parav Pandit <parav@nvidia.com>
Cc: virtio-comment@lists.linux.dev, mst@redhat.com, cohuck@redhat.com, 
	mvaralar@redhat.com, shahafs@nvidia.com
Subject: Re: [PATCH] virtio-net: editorial: Annotate structure field
Message-ID: <yruwppfhsjvpk47oheqhux244k4z3jyacqdx5bvywehn2qfwyv@uu5di5rkspkt>
References: <20241018032432.398821-1-parav@nvidia.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20241018032432.398821-1-parav@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Fri, Oct 18, 2024 at 06:24:32AM +0300, Parav Pandit wrote:
>Field command-specific-data is a structure field. Annotate it
>as a field so that generated pdf shows it accordingly.
>
>Signed-off-by: Parav Pandit <parav@nvidia.com>
>---
> device-types/net/description.tex | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>


Just for curiosity, but do you know why for example in the sub-paragraph 
"Packet Receive Filtering"", just a few lines below, we don't use 
\field{} at all when we talk about "command-specific-data"?

Looking in that document there are parts where we use \field{} and parts 
where we don't, is there a rule to follow? (To my knowledge for future 
reference)

Thanks,
Stefano

>
>diff --git a/device-types/net/description.tex b/device-types/net/description.tex
>index b2a0d39..6950114 100644
>--- a/device-types/net/description.tex
>+++ b/device-types/net/description.tex
>@@ -1217,7 +1217,7 @@ \subsubsection{Control Virtqueue}\label{sec:Device Types / Network Device / Devi
> #define VIRTIO_NET_ERR    1
> \end{lstlisting}
>
>-The \field{class}, \field{command} and command-specific-data are set by the
>+The \field{class}, \field{command} and \field{command-specific-data} are set by the
> driver, and the device sets the \field{ack} byte and optionally
> \field{command-specific-result}. There is little the driver can
> do except issue a diagnostic if \field{ack} is not VIRTIO_NET_OK.
>-- 
>2.34.1
>
>

