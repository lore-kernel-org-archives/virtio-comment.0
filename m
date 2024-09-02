Received: from mxct.zte.com.cn (mxct.zte.com.cn [58.251.27.85])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD349205E38
	for <virtio-comment@lists.linux.dev>; Mon,  2 Sep 2024 13:48:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=58.251.27.85
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725284923; cv=none; b=SYO76PhKOPCp4FOyOfsb5v/BQqX5lmxuysH45QaE2IJTqr5f0lVnq7MmDxSwDgd3/2mFTTvOcNugQyMrXgEWMeOy8HJdzvXjNJm47N+79OY9Pv4kFYiDb1Kus22RC39MGXFZEStlnhqq7riE5XAX3KGW/KRrub6rhS7vIK8V5PM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725284923; c=relaxed/simple;
	bh=+TN1Wbx/HeE+5ob86/3G3fB/j9GC2+4jStFWtEUJIDo=;
	h=Date:Message-ID:In-Reply-To:References:Mime-Version:From:To:Cc:
	 Subject:Content-Type; b=f2i4xaz+XIEn5RJdUvDSakJcKnAmzTHY06t9kcIyHuwxtJ1APuPEEYr8y94HX7MZnWQke8Yfa6MVYucMdvHbMD4ge6iUEOjz2Oh5jLMtLxwiG8nojhyymbsRGECjbKTCqMxqF1J+khCuFE4MlkLWGMg84uBvrkEXTJSedkYY7aw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn; spf=pass smtp.mailfrom=zte.com.cn; arc=none smtp.client-ip=58.251.27.85
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=zte.com.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=zte.com.cn
Received: from mxde.zte.com.cn (unknown [10.35.20.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4Wy8yZ2LMqzKhW
	for <virtio-comment@lists.linux.dev>; Mon,  2 Sep 2024 21:40:22 +0800 (CST)
Received: from mxhk.zte.com.cn (unknown [192.168.250.137])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mxde.zte.com.cn (FangMail) with ESMTPS id 4Wy8yV1WXcz5TCGC
	for <virtio-comment@lists.linux.dev>; Mon,  2 Sep 2024 21:40:18 +0800 (CST)
Received: from mxct.zte.com.cn (unknown [192.168.251.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4Wy8yD4blNz8R041
	for <virtio-comment@lists.linux.dev>; Mon,  2 Sep 2024 21:40:04 +0800 (CST)
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4Wy8y52lYxz4x6Cl
	for <virtio-comment@lists.linux.dev>; Mon,  2 Sep 2024 21:39:57 +0800 (CST)
Received: from szxlzmapp06.zte.com.cn ([10.5.230.252])
	by mse-fl1.zte.com.cn with SMTP id 482DdsVw099935
	for <virtio-comment@lists.linux.dev>; Mon, 2 Sep 2024 21:39:54 +0800 (+08)
	(envelope-from tan.hu@zte.com.cn)
Received: from mapi (szxlzmapp07[null])
	by mapi (Zmail) with MAPI id mid16;
	Mon, 2 Sep 2024 21:39:59 +0800 (CST)
Date: Mon, 2 Sep 2024 21:39:59 +0800 (CST)
X-Zmail-TransId: 2b0966d5c02fffffffffc7e-aa10c
X-Mailer: Zmail v1.0
Message-ID: <20240902213959040zgz5HnwxCr2uHqKd4wN46@zte.com.cn>
In-Reply-To: <20240730101758667R0RC516SBxdCsM2K3dzNk@zte.com.cn>
References: 20240730101758667R0RC516SBxdCsM2K3dzNk@zte.com.cn
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
From: <tan.hu@zte.com.cn>
To: <tan.hu@zte.com.cn>
Cc: <virtio-comment@lists.linux.dev>, <liu.jie97@zte.com.cn>,
        <zhang.yajun@zte.com.cn>, <li.laishui@zte.com.cn>
Subject: =?UTF-8?B?UGluZzogW1JGQyBQQVRDSF0gVklSVElPX0ZfUEFDS0VEX1JJTkdfQkFUQ0g6IGFkZCBzdXBwb3J0IGZvciBiYXRjaCBmZXRjaGluZyBwYWNrZWQgcmluZyBkZXNjcmlwdG9ycyBvbiBkZXZpY2Vz?=
Content-Type: multipart/mixed;
	boundary="=====_001_next====="
X-MAIL:mse-fl1.zte.com.cn 482DdsVw099935
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 66D5C045.002/4Wy8yZ2LMqzKhW



--=====_001_next=====
Content-Type: multipart/related;
	boundary="=====_002_next====="


--=====_002_next=====
Content-Type: multipart/alternative;
	boundary="=====_003_next====="


--=====_003_next=====
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: base64

UGluZ++8jE5lZWQgc29tZSBjb21tZW50cy4NClBUQUwsIHRoYW5rcyE=


--=====_003_next=====
Content-Type: text/html ;
	charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBjbGFzcz0iemNvbnRlbnRSb3ciPjxwIHN0eWxlPSJmb250LXNpemU6MTJweDtmb250LWZh
bWlseTrlvq7ova/pm4Xpu5EsTWljcm9zb2Z0IFlhSGVpOyI+PGJyPjwvcD48cCBzdHlsZT0iZm9u
dC1zaXplOjEycHg7Zm9udC1mYW1pbHk65b6u6L2v6ZuF6buRLE1pY3Jvc29mdCBZYUhlaTsiPlBp
bmfvvIxOZWVkIHNvbWUgY29tbWVudHMuPC9wPjxwIHN0eWxlPSJmb250LXNpemU6MTJweDtmb250
LWZhbWlseTrlvq7ova/pm4Xpu5EsTWljcm9zb2Z0IFlhSGVpOyI+UFRBTCwgdGhhbmtzITwvcD48
L2Rpdj4=


--=====_003_next=====--

--=====_002_next=====--

--=====_001_next=====--

