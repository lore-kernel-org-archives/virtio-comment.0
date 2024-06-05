Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2744C1946C0
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717576949; cv=none; b=n1EiER2X8ocBVIEMIYOsrJpme0tMAyUojoRr247pJBB6WhYT81N5xN9Nf6rRzaAAf8ub8hjjyWOsXhmSHBWXTbdbobQsl4cVuwIuSLXsT9dQSv4ESufvM/62hQf5yiRbRSsxd3RcMlH5rZNWwVIfCOzlG2pQCB6TLBQS5LPjkX0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717576949; c=relaxed/simple;
	bh=gWr3KdaE643wipL/9KzvtaNOolh1H0HltLWBX9KQtI8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iMqh4aowWMqSVwt6NYiYHjYSjSjsj+5eEoXJ3X+K9990hxyLZkhoZOeKHRfIMQEP8Ikt5TIrv+d/x799TzfQhFGZURMiG4aNpBf9hENK3X1ivblp8JCuN3TBtDkFOreXS6VZL7BNTkSdVqsiLuGcwFJiK1cQTHOdtEs57AgEPXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=d8vOF7vb; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="d8vOF7vb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717576947;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=f81Dpn7RnfAPQNnY/0I3+33bHzmsW6dXxi+IuXi13j4=;
	b=d8vOF7vbsZvwvHPSEruWwv6QjCqQlAIZvAQtXbw4QtDbFR9DIQzJ485TdZAVRA1B0QvEq4
	LayszLX+hTJR4wn/AOaKcFJhD1fQSkF+d9T5tVISW3kHhnzb8LSfRKEVJRcUt5lW0wXBGL
	hOER8yaAFs0EgPz29S4URMVXvk0lnAA=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-CPZRn_fwPeKcA6yAEQRUoA-1; Wed, 05 Jun 2024 04:42:25 -0400
X-MC-Unique: CPZRn_fwPeKcA6yAEQRUoA-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ea95d34474so15234031fa.3
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 01:42:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717576944; x=1718181744;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f81Dpn7RnfAPQNnY/0I3+33bHzmsW6dXxi+IuXi13j4=;
        b=iuV1NuAwagTCCfnFODQC7RoW52KXWNyMyyE0QrusDGsqUAP/opIVulHfhEXof6ywnk
         0cSfT1pbN2Pv7E7hfqRhxQ/uJkHOdVqI69GatMtCPdPQ5BB1BoX4XClx6XyIWsMHHJgt
         4KfQcr5ILA0TwKXd2BxB0JjQ3dPzT2IOiivdZ2roC/31wRRJ8F8I7JT+wgjp1Q1I/Pv2
         YglULBY3FGH7wFJ9T7069CjyFwNAOCsARQovvkpyXoE+tmy0R5WjFzS3Ys/839Q+paXn
         C28cEt/o3gKMCQFg0G2KuNngk/RcdUYSW83nkq3zbidJ2NgwPcWa5xJm5XP54ZvnLVe3
         zpBg==
X-Gm-Message-State: AOJu0YwT3eX16YVY8D8M/8cjhicciukBRT0uy3axamnjSv8DoiR9dCY2
	PjypvEV+Q3ke2/E5QwTP1iPe0eMQ8xk1PbRAafu/asTm0LRBVK4BhlV5ap88QwDcjv0Q+zc3fYE
	qLurol1FyoAiW+bpS0i/P90HaDI7fuJHwYIq5fcimxZxMT0YdSvGAZ0zkttnwWndS
X-Received: by 2002:a05:6512:3e08:b0:52b:84bd:345e with SMTP id 2adb3069b0e04-52bab5021c5mr1484798e87.43.1717576944103;
        Wed, 05 Jun 2024 01:42:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGPEJWzH21ONjcZWEX0eGTsb9wH6BqA+jy96+1OlZ/76Gy0jitRC1gGeaFPvLVq7oFu0HBFGA==
X-Received: by 2002:a05:6512:3e08:b0:52b:84bd:345e with SMTP id 2adb3069b0e04-52bab5021c5mr1484789e87.43.1717576943721;
        Wed, 05 Jun 2024 01:42:23 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57a52f5cbd3sm6574673a12.12.2024.06.05.01.42.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:42:23 -0700 (PDT)
Date: Wed, 5 Jun 2024 10:42:19 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, harald.mommer@opensynergy.com
Subject: Re: [PATCH] virtio-can: define out of rage can-id
Message-ID: <pf656j5da3lxgo2nn6nvhyz7tutf2rktbwxzddyhenyyvhzxpx@is6fo76auxms>
References: <ZkyrnsCXu8mQpDQI@fedora>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <ZkyrnsCXu8mQpDQI@fedora>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Tue, May 21, 2024 at 04:11:42PM GMT, Matias Ezequiel Vara Larsen wrote:
>Explain when a message is out of range.
>
>Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>---
>* This patch applies on top of virtio-1.4, which has not been released
>  yet.
>---
> device-types/can/description.tex | 3 +++
> 1 file changed, 3 insertions(+)
>
>diff --git a/device-types/can/description.tex b/device-types/can/description.tex
>index 2511d9c..98b163b 100644
>--- a/device-types/can/description.tex
>+++ b/device-types/can/description.tex
>@@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
> invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
> NOT schedule the message for transmission.
>
>+Note that a message is out of range when a standard frame uses more than 11
>+bits of \field{can_id} or when an extended frame uses more than 29 bits.
>+

It's not clear to me where we refer to an out-of-range message before. I 
only found "\field{can_id} or \field{sdu} length are out of range" where 
IIUC we talk about the length of certain fields is out of range. Are we 
talking about the same thing?

If so, I think we should talk explicitly about the "length of the 
fields". Also should we cover `sdu` as well?

Thanks,
Stefano

