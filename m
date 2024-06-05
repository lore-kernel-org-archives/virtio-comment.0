Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BF01946A9
	for <virtio-comment@lists.linux.dev>; Wed,  5 Jun 2024 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717577566; cv=none; b=M2jyLyswRvlWd2JoSh4DBjoAeapkzXRwx/meqppbX3uMoHRDVZRmMP624DUA8wf2wLXipUozBkOiYfYD/Ro7CuV6hFg5umwcNAEujHlBtQdjF6G8dsJinMpUMPRM1qS2c9EGG3vCDXT7veZDbO3BxYz2iLdoUPqrsAXS3Ik67gM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717577566; c=relaxed/simple;
	bh=yahyv2/P3e37RC39ToD+DxVnhiyHU3MH1KQ7ABoZ11U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Goz2KKpasP4ZCDQf4WynAhIkb8EOMiMpYhsdSbK2TRz5FNt5oL800pm6YLWIUOguywZJQ6BU76OaEv8Q2FhDwF6P4dTql9k09g4Qkru7njY9GDzRrWG1erClYgDk1gqiKqBiLpyG7UaQ+rlTlW5DNdLQ28tehymPOsg4wsvuq2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gxFEmVA6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gxFEmVA6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717577563;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=mCbknyIGYwFDnHkvtyZShuj9swFfi+pYyw+qnzC1KVc=;
	b=gxFEmVA6CbqD8KHzUZIvQie6uA1xBxCnglRl+WnnfHzf0bDrnXVIS18kUVZCN+lQgzOd85
	1UWeRcA+d+2h+7sN7to+sygBa/KkRGOp8fF3moU2b9YVfgGuNl91gCt/V6ndDzwRsMxDta
	mRuZKZl3eJW2i8eUNSw0dP8BqIcgqkM=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-201-WpeaSlR2Oz-Gk_vBsLBiPA-1; Wed, 05 Jun 2024 04:52:42 -0400
X-MC-Unique: WpeaSlR2Oz-Gk_vBsLBiPA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a68ce57fb14so170787366b.2
        for <virtio-comment@lists.linux.dev>; Wed, 05 Jun 2024 01:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717577561; x=1718182361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mCbknyIGYwFDnHkvtyZShuj9swFfi+pYyw+qnzC1KVc=;
        b=gSYVuOlUi+VlbkjkD03ip9qthRpuZyURs6XOKWcQV0f2b1u9gWlOgEZQ2KSFaf1vPp
         AtXTkgqrAEWsUlicrbVdrmI9VRu3Q0HZCS4JMdv6xXQV7v99Luis3RghNM+erFzx3jbB
         n+AQ38Dbty6EJl6PRpIeJlzd+kT6xCBmAgdNYijcf8MJ5aGriYt6gUS1YqNrDo0sAMR/
         9WOLfTx7qJ71L4o8kaRGwsnoAGvc57/1SHNWMMfghm/fbPYx1Vp9d4i4LyYuJY8ij7wq
         JUr8qCrq1moZJWyHnN2c6BAw4igb7vb2hPETD8w7MY5cMxeHXCFFJZcjiJWFbTHXTKQc
         FcHw==
X-Gm-Message-State: AOJu0Ywu9la6E9nWm4A4NDXX4/iK6kCbpxNwtIEMbRzCL46aJT6WB3Nt
	cUBiWE9fxVF7fZFQXwuhkdRmvNoSZMKdQ8XBQUd+gG63ZGuoB+olX4Drw0nxWXAUVjWKO1H316W
	iVk+Mr6EwwntKGEda6dBpagpCfNnqntyEZ4dhPoETw4fYez7F88BL+zqG4rs81YQy
X-Received: by 2002:a17:907:5ca:b0:a69:edd:3339 with SMTP id a640c23a62f3a-a699f6822e5mr154068966b.10.1717577561050;
        Wed, 05 Jun 2024 01:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4cy/eK6PSzwBcw3HxK6HmX8fnh7T5DpKaJCJNijAQ7A6bYZDnRNZV+SD71uVhod4rCz+/zw==
X-Received: by 2002:a17:907:5ca:b0:a69:edd:3339 with SMTP id a640c23a62f3a-a699f6822e5mr154068066b.10.1717577560680;
        Wed, 05 Jun 2024 01:52:40 -0700 (PDT)
Received: from sgarzare-redhat (host-82-53-134-58.retail.telecomitalia.it. [82.53.134.58])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a68c99d5fa4sm565898166b.189.2024.06.05.01.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 01:52:40 -0700 (PDT)
Date: Wed, 5 Jun 2024 10:52:38 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Peter Hilber <peter.hilber@opensynergy.com>
Cc: virtio-comment@lists.linux.dev, Parav Pandit <parav@nvidia.com>
Subject: Re: [PATCH v2 2/2] admin: Fix driver requirement subject
Message-ID: <fpe5yzqaxdgbtvdll4nwflwhvpuunv3kaxoqex4n6zws3pbzk2@vc3lstedxt7o>
References: <20240522174505.57675-1-peter.hilber@opensynergy.com>
 <20240522174505.57675-3-peter.hilber@opensynergy.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20240522174505.57675-3-peter.hilber@opensynergy.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, May 22, 2024 at 07:45:04PM GMT, Peter Hilber wrote:
>The driver-normative section for Group administration commands contains
>a requirement on the *device*. This requirement only makes sense as a
>requirement on the driver.
>
>Fix this by making the driver the requirement subject.
>
>Fixes: bf1d6b0d24ae8 ("admin: conformance clauses")
>Signed-off-by: Peter Hilber <peter.hilber@opensynergy.com>
>Reviewed-by: Parav Pandit <parav@nvidia.com>
>---
> admin.tex | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)

LGTM:

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/admin.tex b/admin.tex
>index fdbf2ac5a93b..3fc732b153e0 100644
>--- a/admin.tex
>+++ b/admin.tex
>@@ -583,7 +583,7 @@ \section{Administration Virtqueues}\label{sec:Basic Facilities of a Virtio Devic
> of \field{struct virtio_admin_cmd} that are a multiple of 64 bit
> in length.
>
>-The device MUST supply both device-readable or device-writeable parts
>+The driver MUST supply both device-readable or device-writeable parts
> of \field{struct virtio_admin_cmd} that are larger than zero in
> length. However, \field{command_specific_data} and
> \field{command_specific_result} MAY be zero in length, unless
>-- 
>2.43.0
>
>

