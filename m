Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42BB12BF3F3
	for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 13:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776865824; cv=pass; b=BQKTv8wnOO8vm+udjOJF6aOUVDx67vjT1kLHlWWY1HYd4KmB/PHTSPga+lC7eQmGM2KXQ01yUTDneq/xXKkYtdWsCsZF9J1PpOAQXZh+lDnjUs1QTI0uIoe8gU3uZeWHTb8ZW2UfF517Yi02Yco+HCznOL8qxx0w6y3yeRRppdA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776865824; c=relaxed/simple;
	bh=QalWPXnz4udRgbdWv4nnhwzqZCXT0A1cjALojrRqzwU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=RI+eNagrBobTtjtC4zny002ikjsKVbyVvg0tzOLZ3d2fa6Be6vkgWlpIG184p4DSv5g6hz+yJJYz7GONLqo54/S3CWS7oHGRUSYEEOl83GpFRf1S8ILlkyYpyQO1JdLCCtAM5ESWxFSzqV6+NMUEdHq/ibLmWV1MOofqI/6UqvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=okaUOT+r; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="okaUOT+r"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43fde5b81a1so4090240f8f.0
        for <virtio-comment@lists.linux.dev>; Wed, 22 Apr 2026 06:50:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776865821; cv=none;
        d=google.com; s=arc-20240605;
        b=halptepUjTNcXa9t4IZxO8ArMiUDWnOldnUgeWjCTIfyL5IUFV/HG56Nfmy1i9DThE
         am3ix4O2l4kzuRW7FIGQO0FAx+JYnPdQOjzp98K6Em5X1BNdOa0AFSlkI+oARtsrfgJh
         ifFQqqgoIi8cTlkZwoFvEEcOqtymlg8kZJKTlM3wdY5Fj6Yv9ZD5AeRBDxDQCoP/Oa1b
         UukR05qeEsGloQnbpJ7FPYJBsrS1KNPp/8XjLFRno82pCT9Zo5Fhx1yA28MR0Oa9AK8i
         EraCikcTSqO70zrK3VQ+hQ/tBw9zYhU1uK9cIdpWOaK6AJGxsXjkG38VwNGD2OHiAESn
         pCbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=U0PoJcJeTttwfKNslSrdMqZdc+b9h2Q//uz6ydAZfZc=;
        fh=goTZg/KYQbwuFcyPn4ftUTF8McfhmLtaDvtEM81HaUM=;
        b=SwoPmwwaxrmifiBDUy5fta6qhjDWwhj+BQc6wPrPuq+ccScbqIKe5axSKRYxfvBp8W
         ssWk6YDj1RgiZrp1IrkUyreEdL/ccdxlUGmLjFmsNC1QBbSSMpLZ/2f2S4T6IdG56ubW
         6GO5D8wEc8bZmlHmPTMvRW5HYf6kq2qFzpY1stUKnH8ETqmvEfsxTI66LzVznl5p8Hfj
         F6gT0os9OkSI//7kOygVvbdmTlSZ2eEJvo7XIB6Vd5E/vlWPT2PTWoHbTk9eXTqvDCea
         PQ3qrvRR+2i/eLLUGevvPct2siZjzD/eyg9RF7XTl5yxcpuaKpRPqsq0Geozt/CN1zoi
         EhAA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776865821; x=1777470621; darn=lists.linux.dev;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=U0PoJcJeTttwfKNslSrdMqZdc+b9h2Q//uz6ydAZfZc=;
        b=okaUOT+rI/tstlSrFuAppQjtuBh1VgjnDZnIVpfUptAZkQOLGZC4T4QiVlOOlix9uD
         1eDF68Tex4aSh1EuwYR0zuOkiDESLqM5Uiw9nAyM85BZq/XFsj5ZyKTXBp2Yf2tXWNsA
         00f9CVRieXt9dSffC8dmBrpYm64ddfinq2SY/5UUd+2XyIFM31NA2I9YCwERAkTgi6GH
         h6CVhQ2aWKaseVTZCrZsDi2cStmsJ0e+74/qIKK4YqAFDPmri0XsatXk77lYEwzFDVMI
         eo/cIVfmGO2Dy60lVBvbIF3gamzBtdCLgTGemmDB3bSKqL02/CK0OsSYX59iX9Aw/Emz
         AOnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776865821; x=1777470621;
        h=to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=U0PoJcJeTttwfKNslSrdMqZdc+b9h2Q//uz6ydAZfZc=;
        b=fP/UaaUA9bHks9pZf0DNmN+tgWZu4Bh0TmDeDG0SAxrL7fuclJNbEDt7LTxfhPSBfj
         Vms8Wos/JvBD2eC23JqcEzii87sM+IRU0r9asfcMyfThsQuxpKPPMgXQ84MI31M83SFQ
         J642Lr9d/UALGAJiBDeUxOa9a02gyxHIiCeWDbw/TeW/DqsoweTfr54Dp4JiMPasWX1E
         ibPHG23alIuic2MWY061h75Lprm+rijBH475aF47zE6sWcJ8NO94gyMGhtsO7mpN7euy
         KvctC8gBIEbyUQiIf+8LJ0CjbunF8epz95yIfJ1RlftBxbai0uBjCFmdfYVEUFCSMN1s
         XYJQ==
X-Gm-Message-State: AOJu0Yx4LQahuTOo38IqheJfowKBIWF9IRp9HXdOHA2l3xm65dGalxf+
	rzIXl3a4KoYYZb1WJ79bVPPm+n3HcApkWND+MIkTX2QKLsGO7HGBYCk7PtNp+PFWLIoDF2adc9j
	7O27V2WMibgioicgDPV870t+hINhBZTBo4/8IK7FVcqdll1bDkAXqivo=
X-Gm-Gg: AeBDietqy/rMTP7LFwEjE82KY30O7L1yII6nZeoDX7UwOzw4OI0ddjbKtdTVZwqvsuX
	hDXOxLI90e7894lzaajLH3rwQSMp53VuQrCHcXi0y+w/4P3Hhkyo/ZrckP0oVrFzqdcBIxDTO8f
	27gcO6wSAwLMU7sfMP8QukQHnzZ+Pe2wDojm0aP0m0gHE00/+mIJWL8klhbs7D0Mk3Kh6t0IGDy
	Tir7iehkD1DEQr5PDCDArUQfLYm7LwEezYlGJSk68gtIQbo5q6aE8jVyxLig6OFtRFaoVoCKciH
	z87skb72C/iaWJGJPR59zjJfJ5kDMEQ/KxxiC3vw66d/JyZObKwwsox9I/fR
X-Received: by 2002:a05:6000:22ca:b0:43d:1dfe:350a with SMTP id
 ffacd0b85a97d-43fe3dfc019mr35068255f8f.22.1776865821228; Wed, 22 Apr 2026
 06:50:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Date: Wed, 22 Apr 2026 16:49:55 +0300
X-Gm-Features: AQROBzAC2YUz4vuTlKhUOc9fTn5lI-JaPtKoyysbI_HJ2cDtPnck6MAUmP60IrQ
Message-ID: <CAAjaMXZHoHwA7sWkZYE0ANah0vwRWtEUYLvc8ULxm5-jggGeYg@mail.gmail.com>
Subject: #virtio IRC channel on OFTC
To: virtio-comment <virtio-comment@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"

Hi VIRTIO TC members, stakeholders, interested parties,

I took the initiative to register #virtio channel on the OFTC IRC
network for general, unofficial/informal discussion, since most of us
idle on linux related IRC channels anyway. I invite you to join (you
can also join via Matrix if you don't use IRC)

If a VIRTIO TC member joins I can transfer registration of the channel
to their nickname and give them operator rights.

Thanks and see you there!

-- 
Manos Pitsidianakis
Emulation and Virtualization Engineer at Linaro Ltd
