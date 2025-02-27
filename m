Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648E225F7B4
	for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 14:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740668388; cv=none; b=isrfg1IfGbX/5qhQGM8j0HCGDnibVFpIk8fT2Q1rMZ+7we8LfRYvjOVm5hzqHdS/mFW9vQE2Vk2OLjE3I15uUnLyIzFHmjTltq47DVvu0veGl5GULHm/oJ+h3g/tHU1+hragoqWQi7QhWj4ixHhZbl8VVjt6klqkZVNt1nQkSAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740668388; c=relaxed/simple;
	bh=YSgiHNJDk9Nor7dcOku2dX+idabHLlh9T/kwLOouU6o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oi1aStohO6HogzfaUd4NX24EZvoBk+wMNUUUsoexoC1U8Uyy5lS2bfpRp9pMxvMrG++TYNR7arKXXXJlwhNeOO4FqgLlTl08ZcTYsPB/cJ0cIvScxh/r53yjkOtJLSwBz8bRtAhV8OZM3uCkkgYdgtbLYp4nu8+U8j532h/DmXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XMZapTOH; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XMZapTOH"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-472049c72afso10332421cf.2
        for <virtio-comment@lists.linux.dev>; Thu, 27 Feb 2025 06:59:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740668386; x=1741273186; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=EQrWJ5XVwUp2s+F6b5Vvfo2Eck6Bc69689Kv+0GnjhQ=;
        b=XMZapTOHDZvIGKAtP5i+WkkYncngk69qO+s4p7FQ2Vj8VsLnFDdIdSuQo30txnxSBk
         UMb0VqexplMI8Q3xp9zwMXw2f0Q+sen6WPXgsbErHIaFm4oz7/wzFixq17uj9f0KiRUI
         /9CBWpn4T8jNNyE6pywqxQEY/+K/gVwJA+Jmp2t8zhiRtJcsQ+gCZVKm3JD4+4C2TLxO
         FzU95glwRLgby5eTXreUupUsD77+cTKFjicLGl3W/18sbA5QsRjFFsX5yG/dYT5MSnOi
         T9oMQDssaM/0vlRPdfpG7V17rEpzshe4k5KPBRdukvGN4jO8DAj3zIfAt9Kznf9RjDJr
         iLyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740668386; x=1741273186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EQrWJ5XVwUp2s+F6b5Vvfo2Eck6Bc69689Kv+0GnjhQ=;
        b=UckbYX0NpUCXWwlYUu1+lsTyqh/25a1vVaGShr1o79GtsoKKMlXonhxfhJjvwX9wkP
         XWDoposMYw6IIORYm9JjLxLKgTJg21X7ehFo7iXvg7P57EqUO09emp/Bs58Ezth1Go1N
         jSxr2bmzqJSLqFL41xAs806kQ2wQzvsnmcpcpM0on76MDJGuH48XdcmWmDaucFrsHn9z
         bi+Nc90iID3AEvSZwJ16QKuwlnX/kN0xRoCbdch5f9fgDyqaGBkhnvHB/UL+I1BHrdiQ
         6oidUQ/AqZNEwz1Sv6t06+hSyMoz27ShLMy1qnyov0gZOkKJRnfyAAYK4xB8E5g7tHew
         FTJA==
X-Gm-Message-State: AOJu0YwkeIRH8xACLgCCODs2vtod4n81G5We8j8jd+D9jVi6Y9ezXvqX
	X1FVwb7fjvadrUY9RNR0xT3YaKyQbKnRR/LF6a1iVe4IQERc0lfeybUIRoWQH8E=
X-Gm-Gg: ASbGncvtk8VmAWuwe6TyHlw0owORWysLNCCkhlQWdkZ/Cip1xtPVE5sx0qyjYsa+dlD
	SXi1vox0Z/SLF6meQjvUs5K6awPFAwakDvuII7IS+ugJ3HmHleFKpSpYBJHtRc0yKQsHAtXrJzH
	DtSl+GuCxOItK+2mMzxrkvzVyhRC+6rism295z5USQDMs9ApyJBQbcxhuXcoc0t8BMVfKUCV3RX
	pKp/gr9lbgvIWdwZRFOe4ISSPs2ZYMJiDKJuqt/eEjoaK0+YvUsEx3qBCdfcGqqenC7E0Fnu4XT
	K1qU3flPvR697jELPxX2HJQGEJ3581CvrqyoTzLKwg/f07ofLDlNaJ0bXaCYBxTRtDlON7Z9dfQ
	=
X-Google-Smtp-Source: AGHT+IFYUN5dZgvMpK/A0xrrWsYmCl2VM+8Ok6Nzyms+N44xROTPs4CJmmZbWV+xy4juNQhiRo0qMA==
X-Received: by 2002:a05:622a:15cf:b0:471:bf80:b47f with SMTP id d75a77b69052e-4738133650bmr85339791cf.24.1740668386270;
        Thu, 27 Feb 2025 06:59:46 -0800 (PST)
Received: from [192.168.2.7] (pool-72-83-14-124.washdc.fios.verizon.net. [72.83.14.124])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4746b5eed44sm11922211cf.24.2025.02.27.06.59.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Feb 2025 06:59:45 -0800 (PST)
Message-ID: <ba506bb1-acf7-492f-ac20-76e8e4dce9e1@linaro.org>
Date: Thu, 27 Feb 2025 09:59:44 -0500
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v1 0/1] virtio-msg transport layer
To: Zhu Lingshan <lingshan.zhu@amd.com>, Jason Wang <jasowang@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Cc: virtio-comment@lists.linux.dev,
 Bertrand Marquis <bertrand.marquis@arm.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>,
 Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>,
 Viresh Kumar <viresh.kumar@linaro.org>, Alex Bennee <alex.bennee@linaro.org>
References: <20250225134801.3546224-1-bill.mills@linaro.org>
 <20250227025757-mutt-send-email-mst@kernel.org>
 <CACGkMEsmvBkfPffDGxpnArOuz_JqYfwZ-uA-H=hWKr5QyjjSwA@mail.gmail.com>
 <41bd1e1b-805e-4a11-b2b8-13dfbad246ad@amd.com>
Content-Language: en-US
From: Bill Mills <bill.mills@linaro.org>
In-Reply-To: <41bd1e1b-805e-4a11-b2b8-13dfbad246ad@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Zhu,

On 2/27/25 3:59 AM, Zhu Lingshan wrote:
> Here is the link of the transport virtuqueue series which is a joint work of me and Jason, defines transport and commands:
> https://groups.oasis-open.org/communities/community-home/digestviewer/viewthread?GroupId=3973&MessageKey=2b081938-40fd-4096-83c8-a2a9f99a4103&CommunityKey=2f26be99-3aa1-48f6-93a5-018dce262226
> 
> This series even takes admin sub-devices into consideration, so shall we join hands for a total solution?
> 

I see I responded too soon.
Reading ...

-- Bill
