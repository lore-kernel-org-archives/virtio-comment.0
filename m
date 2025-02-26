Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D66EC23F409
	for <virtio-comment@lists.linux.dev>; Wed, 26 Feb 2025 19:38:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740598727; cv=pass; b=kQOQh4YJ4bfAjfe7bf5QfBn9k0kC90e+n8vJQ+aYqJmNfPTrS5voHJcTn4nuMJxyH7tnxYm35I6dayG1h+k6t8leC6LM1j/Zb2j4Wmacyp8k9upK/yyv20QUIpRO20MRvxLxrdngZ1017eyK0lG4DD7K/7XBz2RUz9HwqM2jjms=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740598727; c=relaxed/simple;
	bh=gLbbfZYJfexZ3ER8/CArqBdsyQJFfbs5pERTCMepVA4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FSEtBNjOrKaRLiO23SP+Z2sArLVaWKRFG2frtguLWuARowv+L+jkP/tImT2rD1UdMyF5sgljaO+LvU6UOThM7cCkwgFPSth29sPstGsBA0htdg2Poqc0gKLaJuM4qg2eg8AeHVtJcYZgJtTfttgnGXr5yX2T7t4QTr2G/66QNuk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b=bfGofjdY; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="bfGofjdY"
ARC-Seal: i=1; a=rsa-sha256; t=1740598717; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=M9dsjcr9YpLmTIdemxdfIeky9AgIuHcC+ECpC8eZxUlufcqZBzqGWxEISKeVP+OJXQvYnQ6t4iuk9SFw4dIns8lgW4cH4TgdqCG9vCP+kx8qXPcxn+YQOOCSD3/WA5E+RM37oi+1NFUfEVChvGqDamxLcQfMkTOLAm734Bv8UEo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1740598717; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=y7TYBNoVkm/LLrtMBETrWzgFfesvn/B19O6t8cgyYIc=; 
	b=D3EE4639pYxX92hRkmZ8MHtl7MJAZIeYjtkWb/2VOUOrwJv98ARlC3AcbK7xO88PvH+woKUYGKkXSyt3LSGUKbcMmTb35jc7bDvZVd/OIShfh/p0EduX3uKXL/8p6P6rN5rCWXIU4mzx52jkX7RTtDJYUyX5sR3bxYlz/jPyFYo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
	dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1740598717;
	s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=y7TYBNoVkm/LLrtMBETrWzgFfesvn/B19O6t8cgyYIc=;
	b=bfGofjdYFwNXMZcx9bKzA+M/bCoVwlzwcRI+M7Ls8ETsFYhhIuKqBROvPF3fx8Bp
	C/SxaW/BTAUr4yXtc3a9XK7fn2XJ2xzbzgzU3Rd5DNfIyqQBhf0b7XMrSII8HUUm33K
	DuWBQjTKt16kAUqOACeR9Nyb6giBEiFSHvu7m4PA=
Received: by mx.zohomail.com with SMTPS id 1740598716488707.5728715685456;
	Wed, 26 Feb 2025 11:38:36 -0800 (PST)
Message-ID: <3956a062-7326-4d1d-8836-5668dfcd0468@collabora.com>
Date: Wed, 26 Feb 2025 22:38:31 +0300
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] VirtIO-GPU spec improvements
To: "Michael S. Tsirkin" <mst@redhat.com>,
 Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Rob Clark <robdclark@gmail.com>, Huang Rui <ray.huang@amd.com>,
 Sergio Lopez <slp@redhat.com>, Akihiko Odaki <akihiko.odaki@daynix.com>,
 virtio-comment@lists.linux.dev
References: <20240719120638.196052-1-dmitry.osipenko@collabora.com>
 <de02684a-8f36-48ba-b505-85b6d74f5e8b@collabora.com>
 <Z788Yrh6qy9dJOVP@fedora> <20250226122903-mutt-send-email-mst@kernel.org>
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Content-Language: en-US
In-Reply-To: <20250226122903-mutt-send-email-mst@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

On 2/26/25 20:29, Michael S. Tsirkin wrote:
> On Wed, Feb 26, 2025 at 05:08:02PM +0100, Matias Ezequiel Vara Larsen wrote:
>> On Wed, Feb 26, 2025 at 01:59:06PM +0300, Dmitry Osipenko wrote:
>>> On 7/19/24 15:06, Dmitry Osipenko wrote:
>>>> Hi,
>>>>
>>>> This is a repost of v2 to the new virtio-comment mailing list.
>>>> Michael Tsirkin suggested to repost the patches, here they are.
>>>>
>>>> Dmitry Osipenko (3):
>>>>   virtio-gpu: Rename GFXSTREAM context capset to GFXSTREAM_VULKAN
>>>>   virtio-gpu: Document VIRTIO_GPU_CAPSET_DRM
>>>>   virtio-gpu: Update venus-protocol URL
>>>>
>>>>  device-types/gpu/description.tex | 11 +++++++----
>>>>  1 file changed, 7 insertions(+), 4 deletions(-)
>>>>
>>>
>>> Fixes: https://github.com/oasis-tcs/virtio-spec/issues/182
>>>
>> I think what is missing is to explicitly request a vote as is explained
>> in 2) at
>> https://github.com/oasis-tcs/virtio-spec/blob/master/README.md#use-of-github-issues.
>>
>> Thanks, Matias
> 
> 
> if a vote is already desired, then yes.

Please open the vote.


-- 
Best regards,
Dmitry
