Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D287341C92
	for <virtio-comment@lists.linux.dev>; Thu,  6 Mar 2025 10:04:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741255490; cv=none; b=Jg/DWkaOuCK48qvgX8/oOtF1+CF0NywQ8+O+gk4cWFlo5NY9z1dWbAZ7GV5ws0I29nLLA3KtkTGAwqcqCdgczmBII3/0sMrDfVu4rlyfVT9N6wxzensR3gFuFQNfBYkY/rjExq5E8t+phudKmS0NKKgjPxvZ+BranlnWNBYC9EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741255490; c=relaxed/simple;
	bh=wFOwehBngk/MBMAlWYxSBtFUicwrTDH0wiTwjakvFis=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=OZHgViYVUWlmEEF9wCxFdRPlo/pqWvk8aV+s3Jbt1dlLbzqaIWs4sl/wL1J5PP9QwUr8Ma17xH2OfdTbDc8pvBvjF+08bRYViCkQf2hyZRSuHAq9g4oGQLYAON2A6R69AM1BQx04P90e8g8A2FtWbkDQ2FUCnWCA1anjrwcKg4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DQj6+Bz2; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DQj6+Bz2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741255487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=QlhBdAe3RlBL+8vXPxEGqzXg9VWRsMbstrjoF0onZ9E=;
	b=DQj6+Bz2N7QsVHtYQrlrqZNhVmTBZyDSJVOaglDOzW4sL4y2WhYkUNHFn5tnXCAqR9GHVc
	BQBWldVwO2vDDgQgmtqDxVkxZQFgdYXhAZnntgQSm1Z+3Y3txoZzHCm4EbdcEhnmYR0Q9X
	xhl9ZUKJ2MZgx5ux/vM+5KjTPTubPUo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-608-_OgW9DCSN9W874mupESCmQ-1; Thu, 06 Mar 2025 05:04:45 -0500
X-MC-Unique: _OgW9DCSN9W874mupESCmQ-1
X-Mimecast-MFC-AGG-ID: _OgW9DCSN9W874mupESCmQ_1741255485
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43941ad86d4so2027795e9.2
        for <virtio-comment@lists.linux.dev>; Thu, 06 Mar 2025 02:04:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741255484; x=1741860284;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QlhBdAe3RlBL+8vXPxEGqzXg9VWRsMbstrjoF0onZ9E=;
        b=rNI6X4FSqbJ2fLyQnfyelBlZhzHit9RUlu98S1yC0HzIGS0sjmjYsCooIRtLNgysx2
         t4/CzCqHuvl0ehzwMBETrnJ52GJ97FeQwrVcaaUx4rM0G3SUw+kAPXUnEoToKA/bi1OI
         47THuPdIARMcOh5E65cd1wN2qLS1zG6Otv9bHtxEnP1tiN9yQ7nS9UFals1pjc9sQqDH
         9NZeO1OeTHp/mVBGEffIs2DpIyG7CeKOHzPpbZVnPs8g3w4bMvl2IdCjYQclpVUDTaVs
         Jvo8PUyT9LT1YZC454bv/k5U7cNyZ9kmqSJ2U+rFPrICiPoSJtfrc1o8h5kOc3/LcTMa
         iWoQ==
X-Gm-Message-State: AOJu0YyA+NYdXeD6IB8frWx29Q65pQv3qQ9/Sv3I8d5Qao4kjco/XqCI
	8b5rV2hkqxq0GVvSvi2mId9v27cb9xBcUON5eyq/mxiSCGPB+krKh6LRouvU7HhgzaUCHCWAAFG
	7JbT0g5Wj9NHw95lFuXBmtDbU4/wsH3RWLTlelLOeKeJrOII4ug5A4nRac2dxzb/S
X-Gm-Gg: ASbGncvEs7i1mmFJ7BPAdLr/ydlVWA94ZAPtPa5NaG8sZnhQ7umHtX2nIZ4oopXdwad
	oGSiBmVXP779nwqUK09Tsw0b2yCGFKU/R+Xk5+f07b9XrMrzMspH/5bNvrO2cnb4S+Q2vBAa7Df
	j7b6e15PWKJjBkILVoL0bjycfpTCyUUFggWYv5hM4Gfi/brqe9Bp654LvduPOOL9Pi/YL0xbcTL
	Wu3k+a7GNRuRgBq2gy6XipQNW+84o82/Qokx4WVSDCECx1ihSA5I8nrGat71upW04Ke1XtTJfu1
	meotXRcyjHqcgKo0alp9OT8l/FrHZq48VCe7OE0BB5OumdyYVDJs7WiMQp8Pyuvi
X-Received: by 2002:a05:6000:4007:b0:38d:dffc:c133 with SMTP id ffacd0b85a97d-3911f7c3ee6mr6912554f8f.44.1741255484649;
        Thu, 06 Mar 2025 02:04:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE1Ad8fSjieE07JixpFT4fA8fk75Wup2QpoYnk0fzXzE88Q0GKsfF4OW1Ud3SJZ1Z45kt/c+g==
X-Received: by 2002:a05:6000:4007:b0:38d:dffc:c133 with SMTP id ffacd0b85a97d-3911f7c3ee6mr6912510f8f.44.1741255484139;
        Thu, 06 Mar 2025 02:04:44 -0800 (PST)
Received: from sgarzare-redhat (host-79-46-200-29.retail.telecomitalia.it. [79.46.200.29])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd429195csm44556475e9.10.2025.03.06.02.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 02:04:43 -0800 (PST)
Date: Thu, 6 Mar 2025 11:04:31 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: virtio-comment@lists.linux.dev, aesteve@redhat.com
Subject: Re: [PATCH v3] git-publish: add profile
Message-ID: <b6twcw3oji3qcjiestjvtpjknnczsrpfphbu43dlwcybukz3lh@pbt6fpqf23ds>
References: <20250305164546.1484029-1-mvaralar@redhat.com>
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <20250305164546.1484029-1-mvaralar@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3qHwnrEzA5u7HoA1YVxj1gM_Jj_USL1Og3Gb7ebsb1M_1741255485
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Mar 05, 2025 at 05:45:46PM +0100, Matias Ezequiel Vara Larsen wrote:
>Add git-publish profile and document how to use it.
>
>Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
>---
>v2 -> v3:
>   * remove uppercase and the line split and use italic
>v1 -> v2:
>   * add link to git-publish
>   * document that the project contains a profile already
>---
> .gitpublish |  3 +++
> README.md   | 15 +++++++++++++++
> 2 files changed, 18 insertions(+)
> create mode 100644 .gitpublish

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/.gitpublish b/.gitpublish
>new file mode 100644
>index 0000000..d412896
>--- /dev/null
>+++ b/.gitpublish
>@@ -0,0 +1,3 @@
>+[gitpublishprofile "default"]
>+base = master
>+to = virtio-comment@lists.linux.dev
>diff --git a/README.md b/README.md
>index c06caf6..b521978 100644
>--- a/README.md
>+++ b/README.md
>@@ -110,6 +110,21 @@ git format-patch -o proposal1/ HEAD~1..<br>
> git send-email --to=virtio-comment@lists.linux.dev proposal1/0001-*
> </code>
>
>+<dl>Optionally, you can use <a
>+href="https://github.com/stefanha/git-publish">git-publish</a> to submit a
>+patch. This project already contains a <em>git-publish</em> profile that will
>+configure some fields, e.g., <em>To</em> field with the right address. After you have
>+installed <em>git-publish</em>, the procedure is the following:
>+
>+<code>
>+<p>
>+git checkout master -b my-feature<br>
>+# work on new commits, add your 'Signed-off-by' lines to each<br>
>+git publish<br>
>+# more work, rebase on master, ...<br>
>+git publish # will send a v2<br>
>+</code>
>+</dl>
> <dl>
> <dt>When to use the virtio-comment mailing list:</dt>
> <dd>
>-- 
>2.42.0
>

