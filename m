Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 106F5D515
	for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 10:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650124; cv=none; b=YdEUWQtFLGdz9GjN3+MT5IufgFftn9MTaBZoCQoUy3p/VZOKdo7pfhOc2oyOFu8D1Yb73FdyLWfkzfdGXyZZykbNFNsAWn1RLnrZ8fpuev4it3ljAAEPSP9GPIFNdm5de3BbrczQ2PauwmRxs3eXVAz9G7dYIUlNMliPec0yyEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650124; c=relaxed/simple;
	bh=Q9FYbHT1ki+ZVRI6GsRS44dKZcll2B+jy/JSFHqrFAs=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=HxiHdY7+QxpX+KAx0IDiYvrHVscPHu4Sbd8hFNrhedgyYhTTO3e09eWoBfwccDzoqpHvmabWr3SVB7ulwWEEZYn9YjqygAWgWIpOBvb7iRrDZOC0u3uHsiMhTFNgtfiHq6ZtAFCstqRTyKLpSqaJfKj8X96YtD9715G1xDqRLOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=EFmZocH/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="EFmZocH/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747650121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BNIthXkWjShn80MPAm/eXAGHnGfUeEaULOWkW1GGFqk=;
	b=EFmZocH/E3en3RLr720qwLzBqLzeTW24720uH6qIKk5ePEIpjORvYSdh0tSBU0dCuXx9Uu
	s9+WVxLKQ2mXaYCum9yZb5B1cjcjLaqFBp5Ihd0VdtlAmMrIS5VP4+Ng66m5WOcpfMkAfX
	grzs+Rnfh8RQqMZyCkajOW3OK6yXOfY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-SAZl8FOrP-WMsoXQ17fClw-1; Mon, 19 May 2025 06:22:00 -0400
X-MC-Unique: SAZl8FOrP-WMsoXQ17fClw-1
X-Mimecast-MFC-AGG-ID: SAZl8FOrP-WMsoXQ17fClw_1747650120
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a364802ec5so129232f8f.0
        for <virtio-comment@lists.linux.dev>; Mon, 19 May 2025 03:22:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747650119; x=1748254919;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BNIthXkWjShn80MPAm/eXAGHnGfUeEaULOWkW1GGFqk=;
        b=jXpE3ku2ti+0W75p1+D+3n6/qPF+jYX3pD5na8xqh9H+2T5XUevYgZ/cS2LR7UYdpJ
         U8/oErPeLfnpx87gpMEyZ5F+D14HC8bbBnxCmH6F4r+RYiVcSU3rfJhdrPTIPtJ5AIgE
         tfMlNG+2n/W3wH+At2De1zaOCLoNSX6DbWloOE04/OiDGi+5cTRz0q+vMFabYJlduMe6
         XybcgO+Jt9aUaNGOJQqm/+eXUw2RfA4lELp5XviH+T50v0lUTrstkZ8/tJpHbK8WxbRc
         19P9aczushnEQ9QND5XgUVPf94UacrYTSdgrkoyc7SBba1MqYB227rQtwi+odFVVTMjv
         PMWQ==
X-Gm-Message-State: AOJu0Yzm7GZeUC6N1cZhUt/ECyreP4PIhmFwcxv3fNDSxlsApuvP5DGz
	DZMpIj5q5SdvM32ObWFmPYb14SCOg/xc9Px3Zn52ZS2r7kYOGZrs1LvmSOCAo/x1aJ7n3jCju4E
	CkpoNp06+574n8AiDcgqYOarQttn4fUaOXh9lazP7zq264KXz8DPWycQsXjT0JR/NWy9AKndZuP
	AdPjK+mQ3EzdkNzaZ7wbQy0lFjfoa2NHY31I3+BpSb8RSSIrlEIgHF
X-Gm-Gg: ASbGnctIPTxbmuW2Fd95HO2O/ZgqGzAQ8AHH0fH1zZD0gyWPGSj6J1mne+XadPcQp4P
	Foozuh9WPehL70PLk17+Q57CpAf3WCaVy+kcftWa2x621UI4Edl3GDIUiNod+LIgke0Wn8vT5L9
	/5BeNe92ihAfesYrYbxqT4uS0hrcSS5raO4OnXQkpe2VQsq+4GRDOXPEG5aD1lMnAIJzQq/6I2e
	zyk0H/Kvk3WD+S2P6OYEpdASpGiolG8vGEeTUk2fD+yO00BOUAyhwT42KPcT86T3JKLPcUKI3U7
	8HJv9DDwXupLyCV/Fjo=
X-Received: by 2002:adf:f550:0:b0:3a3:6273:7ff4 with SMTP id ffacd0b85a97d-3a362738165mr6977476f8f.39.1747650119320;
        Mon, 19 May 2025 03:21:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoqEDQOlR1QkSl9fsCqO5BcZXjf4UERUAVxXIzuIUftwbJETneWQWKLD8s9Ho4P57Lo15Miw==
X-Received: by 2002:adf:f550:0:b0:3a3:6273:7ff4 with SMTP id ffacd0b85a97d-3a362738165mr6977457f8f.39.1747650118958;
        Mon, 19 May 2025 03:21:58 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710::f39? ([2a0d:3344:244f:5710::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a892sm12063833f8f.24.2025.05.19.03.21.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 May 2025 03:21:58 -0700 (PDT)
Message-ID: <c6c9f59f-2960-4155-a984-a5f30586e7f6@redhat.com>
Date: Mon, 19 May 2025 12:21:57 +0200
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-net: clarify guest offloads <> features mapping
From: Paolo Abeni <pabeni@redhat.com>
To: virtio-comment@lists.linux.dev
Cc: Jason Wang <jasowang@redhat.com>, Willem de Bruijn <willemb@google.com>,
 mst@redhat.com, Parav Pandit <parav@nvidia.com>, mvaralar@redhat.com,
 cohuck@redhat.com
References: <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
In-Reply-To: <a30de484ff56065f56e37446e08dcdfa4850f101.1747649330.git.pabeni@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GpI8fvPHU_R7CYKEQJpldnUb_X8FkKzEixTrN1K04Qc_1747650120
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 12:12 PM, Paolo Abeni wrote:
> The guest offloads, as specified by 'Setting Offloads State,' use a
> 64-bit wide space, while some of the corresponding virtio net features
> are in the upper 64 bits of a 128-bit wide space.
> 
> Clarify the relevant mapping as somewhat implied by the current text.
> Also rename the offload definitions to avoid referring to different
> numeric values with the same name in the features table and in the
> offload table.
> 
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>

Fixes: https://github.com/oasis-tcs/virtio-spec/issues/225

I would like to ask a vote on this issues, thanks!

Paolo

