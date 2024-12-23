Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689A318FC79
	for <virtio-comment@lists.linux.dev>; Mon, 23 Dec 2024 10:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734951431; cv=none; b=cw4y28/L+GoiwpMkVu0YYKqv1J4jKRI4Ws1AHk3leUwQGNr1vQ141e2STDdgUYMsfZ58nLGYbYaMPxPhE/AvgaEQmKXH5pWxdKlb8dIbBBrutHTKKixZ7U2KB8oJGwvAkif+VJ7J+H13aMmS4tOVdp1aqS6tLPXOe2vXH4uVsHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734951431; c=relaxed/simple;
	bh=72tlyGwEsUCxIYX8P7twHwRmwZoyaz979iwS8TaC2zQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=iQW34XQ6BXutFcZlY3seZTU+EAyNbY1J6RIdUa4cVsebxu47f5VGYbeqpLE+WYizkSCEcjpB/sQ8Mzo37kt3zmfvuziuhSE6hfA75FysRF43u+v5KWcgVzqUcf7FIYDEfZ2fG+ntV91favvVNupYW7Up2xhbsQyRu3znyobXv9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=L6oA1n6G; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="L6oA1n6G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734951428;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=4N/W7CATAIyDv/3BfwG5hI9Pa8VpN2z+ENS7UhlW4gM=;
	b=L6oA1n6GhPBtntyQcPZvFfJZMRM5Zd0IHm1JcpQYzmZVoy735j9ZScZtujWlb3qTJWHgHR
	7b9jCVAYpEHKrbN0lzgsAxB/OLOX8XuYB/dB2+1gI1h5eREvVHx3Jz3fPr6nUecdNu2ZJG
	PSw3gE70GvGf4PvsgkBkoimD4OyzYnQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-JxJ4xmz0NYiYXQtHG1ihEg-1; Mon, 23 Dec 2024 05:57:06 -0500
X-MC-Unique: JxJ4xmz0NYiYXQtHG1ihEg-1
X-Mimecast-MFC-AGG-ID: JxJ4xmz0NYiYXQtHG1ihEg
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-436379713baso20570435e9.2
        for <virtio-comment@lists.linux.dev>; Mon, 23 Dec 2024 02:57:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734951426; x=1735556226;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4N/W7CATAIyDv/3BfwG5hI9Pa8VpN2z+ENS7UhlW4gM=;
        b=UuG19V4FWlKpaOFo7i0UHtjrbXWQcNZv+OzwTtcT7cOHIFTXRqI+SVSoNiedDOeLNF
         vQ6VtTm7LFKYrnaLfJNf+cFVncxiBYVv4E1XxK3ocLtZW5D/yqKj2/1av5jji8EWIXVo
         ZxaDCQPWcSqVkQ6Xa0e9ncBUDzNkp4hfTQcoRuMzylwEhC9rFh2gVLlMSRA6in1OZDtw
         Okwa1664MvFN4AtbSkUdR+LAP5AUBCskT140kCgx30PjefgUJP039LRFBXJ38X90GQ+Z
         b1jSwjC7sCS3rC3pbk1jFLwMNnLlkBUI6XYkAK3hyB+ADhSjlSzw7aGzFrK7N3+qgZFn
         VETw==
X-Gm-Message-State: AOJu0YyKzc2XQw5dUi7GK3m/hpYkzAJZjw30BEpO2Sd4EE7rddNN7nAN
	WZ11E6eFAw8Noyd/KiyuEuMfLR3ug1UptGhdxX8XwGf+k6qop4bAxm9G4Jidkt+eUWSFm1aBWet
	R+zMbbmH0eYoFN5M7X1Q299Aqu2A/TlFBFm1o0OSLmna+QgXejpE982kPsE3LP1xs
X-Gm-Gg: ASbGncsE5SjWhesFYvZiEXagtH1h0EyxlXrH1zkp/RvwyZDic4pZxuJKyjsL/qdfO4g
	0CQA+VVui2kUS+9u9pBZT6V/z5Iyz8YGbJa7c8e8FhmC23o4LbgVi/fQe9HXb0OPPHvoAHvVR9A
	pBFapeC5t65xjSmQOFqQXYVQOgFpRUPlIKjIOWcq43ugTRY7WcXKQ4sxLKdWcBINwAiOOS1cxlp
	IPc8TZCTihCOJV2x3L8zkvUXk0cLPsKd3865dvTvjOOBrFnFfU=
X-Received: by 2002:a05:600c:3b86:b0:434:a1d3:a326 with SMTP id 5b1f17b1804b1-4366854848dmr97045105e9.6.1734951425767;
        Mon, 23 Dec 2024 02:57:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGW3D9j/byAIIvL9MfGoO9KRuEkwhV6zGbg3UNHfwOvfIu1ipgQI570oM+3F4aF0OGtdIJzKA==
X-Received: by 2002:a05:600c:3b86:b0:434:a1d3:a326 with SMTP id 5b1f17b1804b1-4366854848dmr97044905e9.6.1734951425367;
        Mon, 23 Dec 2024 02:57:05 -0800 (PST)
Received: from redhat.com ([2a0d:6fc7:346:6c6b:84ca:1431:2b95:1533])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c8acc02sm10982437f8f.104.2024.12.23.02.57.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Dec 2024 02:57:04 -0800 (PST)
Date: Mon, 23 Dec 2024 05:57:01 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Alexander Gordeev <quic_agordeev@quicinc.com>
Cc: virtio-comment@lists.linux.dev, Trilok Soni <quic_tsoni@quicinc.com>,
	Srivatsa Vaddagiri <quic_svaddagi@quicinc.com>
Subject: Re: virtio-video device IDs
Message-ID: <20241223055543-mutt-send-email-mst@kernel.org>
References: <bbef01ea-2085-49a8-bc6a-76cf66a6183d@quicinc.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <bbef01ea-2085-49a8-bc6a-76cf66a6183d@quicinc.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NVs9X3G1obRdKeaYFqi0zvBEDOr5ib_Pt-yS99FQ4HI_1734951426
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Dec 20, 2024 at 05:47:11PM +0100, Alexander Gordeev wrote:
> Hi,
> 
> Currently there are two device IDs assigned for the future virtio video device:
>  * 30 for the encoder
>  * 31 for the decoder
> I received feedback from our internal reviewers that in some cases it would be better to use as few virtqueues as possible. So if a single piece of HW supports both encoder and decoder functions, then it is better to have a single virtual device, that provides both functions as well. The specific function can be selected per stream then.
> Is it OK to make changes to the reserved IDs?
> Are there any other concerns?
> 
> Thanks

Basically, we need to make sure there are no conflicts.
The IDs were reserved by google and chromium guys.
If you want to make changes, get in touch with them
and get their ACK please.

But generally, it's easier to just reserve another ID
for an encoder/decoder device.
We are not short on these.

-- 
MST

