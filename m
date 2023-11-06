Return-Path: <virtio-comment-return-8190-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6344EC4332F
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 07:21:49 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id 8C7D67410A
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 07:21:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 66AFA98671A
	for <virtio-comment@archiver.kernel.org>; Mon,  6 Nov 2023 07:21:48 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 53C7C986705; Mon,  6 Nov 2023 07:21:48 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 44195986706
	for <virtio-comment@lists.oasis-open.org>; Mon,  6 Nov 2023 07:21:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k8qKRFnGOSeA5YWnfuLAo8NSi/96qFQEF1WlbsoVAf4gBIcuSpqsEGUONFFC7qgSZYEPnSj5g8b0WbTRhcQo2mPmkkgjHV2vrHLEfpARDLjyDlb7XUYApP65Eb1zrgjYBfMk4kYnb0xgfIBBF7gAq4b2F0iVSj/fD8/CcNlXOBSrRLaH2ykLPT3p2MbL9SB/IdC71tQNHdrfoAGprEQ2aUpABNvkmBdR9rdADe+f2j6fFE/OnS1D/udEgsDrsgPOrxj3jKozEUFBomIew1Qj+yEnASb9CN9Cz+R3r3tYNmwv4tvhPY2v3ViFmncpPjf/UTk0RxwQ/b//gFhGIV1cgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IE468TFyKNfolUVWDfOJ2o4z1Z0JnOXYzWywq9W0e6o=;
 b=YO4NQk8qwKwPhzznn/0grIyfdculcEqgAHhJUGbPt17VzqsDgcbH7AcBIwfkQSjxW7GCgYiin/C2eQ5obMGHDPZDNw4ILWfvJhJkHErovemzuSuDHpRkt0xSd3qfVs+I/TZPFqg170kgKZIoHw31jD7CqAbLof2gP2ElL2B10sNmJG4m0mPjeN/xj6x0MGsLoYoXtXcWf1f5g+Dh+9RDUkT+ow0lMjt99fWwBrQYmDWUac5ezTW/S0U7U7b/7nMJ4bU9kJqwwCnRN5/hGKwbk5GX2H33EdnqUj7O/tpLGjuVfbrur+xDZgBKjrFW+GzkvaVve8RSukKyRlFbJygomw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Date: Mon, 6 Nov 2023 15:21:22 +0800
From: Huang Rui <ray.huang@amd.com>
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
	Gurchetan Singh <gurchetansingh@chromium.org>,
	Rob Clark <robdclark@gmail.com>, Sergio Lopez <slp@redhat.com>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	"virtio-comment@lists.oasis-open.org" <virtio-comment@lists.oasis-open.org>
Message-ID: <ZUiT8vBc28vUgNoQ@amd.com>
References: <20231105211728.808219-1-dmitry.osipenko@collabora.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231105211728.808219-1-dmitry.osipenko@collabora.com>
X-ClientProxiedBy: SG3P274CA0022.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::34)
 To SJ2PR12MB8690.namprd12.prod.outlook.com (2603:10b6:a03:540::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR12MB8690:EE_|PH8PR12MB8430:EE_
X-MS-Office365-Filtering-Correlation-Id: afa98a28-6fc8-4fbe-529a-08dbde9907dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	Jmh3MHyFZVsYBG+jr6y7Og78L2zVHKFI7HhYOARkqrtYo/9x1k74rUluc/muhYf06mJjW79bvtp8ym2yBhM+0+1CTHVFCSWpI3MuKCzWJpRE2FZqa2J7D4uMENyZCvkBS+2+oxWrJDx6jQ/bW/5/15jIlc1dEa5rJTd7NVfqKQTv3LlSsG+thZEuGb2PypsQQpDdtLd5rpBgoR3pFSLBLTSgMBwuX0TUaYMbSVUCFd6Qu/2FycOyOemURv8HJaL0kp0LJxrT+QuYVg4Ru1jOdwpL5UG5q0cIOitLMjAaXf0Uk0TkuclrHh60L5mC11vGqtbq8SYcQo12wEmfkYqSs2maoU79kFjJHS8I9ofFoe7aiMTGLOnco24DeS22rW2T/J1iknzNLriAfq0ALc4UyLq0kL+kclgnua+aZS2dXEbNfGzb7ObQZqCOOHQ+MUIsGC7YrdrcJjtvD/3V6zclJR7GTi3+rlQbw3cM1gMsTdf1fIRf3fHlVPEyiYuaI/4G3QPNuc/mxshKVpU2jPvcBp+3m5dc9KI9GX7d9kX1lnE8hSjjT4yt13vvJGGfozlboJv5L1Byua+sUkHWN4K0ZQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR12MB8690.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(64100799003)(1800799009)(451199024)(186009)(478600001)(6666004)(8676002)(38100700002)(966005)(6486002)(4326008)(8936002)(6506007)(5660300002)(2616005)(6512007)(66946007)(316002)(66556008)(66476007)(6916009)(54906003)(26005)(2906002)(83380400001)(41300700001)(36756003)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?onY2otZW2PLXivCCJWxfR3EdCE5oR8164tClo+n4MYNILSJ3eINLWj2TzwO1?=
 =?us-ascii?Q?rMtNqd7ZVfiU9MPSAeI5dMCgwdT9ma+4fL08zF8Ov5TGrVjzT0VAxtxOdYPb?=
 =?us-ascii?Q?vqZww3ScBDt4g5OWLmVvHGrnqN+oTcAU6UTTipfHF0MqizNpG1x76ap3zFYh?=
 =?us-ascii?Q?jP1vwN/9hURJjcy7Sjb++bcs9MM0emR/0qXVlTuk1rLAZlTiyFriU3IQC0BB?=
 =?us-ascii?Q?e6mgeH3u23AdL9XPK6bG0jor6D5lG1uspyv0Kads3eA3bOl5IUYhVigxwM59?=
 =?us-ascii?Q?5NmqkH7BCP6T64qtbdk2E36BCr0ESO2cwxxK5CS3K4Ds21CQrSBrUrCCEQMK?=
 =?us-ascii?Q?2fhMF3Fg6zaMcSaCV7jSYE4/Y4rLL/xMYWOm9F6p8uo2K1MgmOVQLb70AJZ6?=
 =?us-ascii?Q?R97byfy6nFUW9jS6cIPdjcgK0qbfnwV8UnuTY/q8+St9wFNz9QrNHJ+NM8z4?=
 =?us-ascii?Q?zG+WYPou9mjDSByWlGArNmFsnaH3ns3mabvHQ891td4Q8XRQv/zgGOy0VcUk?=
 =?us-ascii?Q?B0K+ESMlY0P00CjvNIWc0uaHE4CzwWSmgtIXZAABYcZ63pNo7MZHol4b8w/r?=
 =?us-ascii?Q?L7ZQrtkbIo73Uup4VZ6D3qbJe4RzVlccg2ZMSoJu+8J/Mn1YnupJAnB22mJc?=
 =?us-ascii?Q?DXcmIxPmwCd8xHXcYRynziByOCzDeKOdmd1ni8WeeSNLhKydpcy0ve56zWlt?=
 =?us-ascii?Q?M64BghO1NvwYS3xyhX0utc3FyHQ/ZZByCCLMvgfHX1+5Zh5YjM72tX1xiqBy?=
 =?us-ascii?Q?txFiq2DtdCIuRtqBkIHKcp2sEVpGM/CptTYyeiZh4nI0+ggWY7ycNFbXBR9y?=
 =?us-ascii?Q?5cDzONuNpfQmi/zf9uqYTAiOTFZy9KiNepJ3d3uR5JYUrCIximC75EmNkOTH?=
 =?us-ascii?Q?cX5RhgX9z7DNd+rklOMtQMw5WOK8KJg/ATFPIx+MduOX4ap+MdjAugmU/SBc?=
 =?us-ascii?Q?rfphfYaZ8Pt3BE1ekHTIxkd6L2CBY7BPl455Gid7yeGie/7uc5fkI88qjrqe?=
 =?us-ascii?Q?AdLY6oMo4yTVgvqf8HLwTUfG/OBl/MMJdRcIhGrXMBVrdS0FcxNe2DTQpJC/?=
 =?us-ascii?Q?JwCVLOEcws7rCHqglYugOUODcU30F+28DyUAk62TDUHerNHhOzM+DBAm3UCH?=
 =?us-ascii?Q?r6PkrSld/0gSiDDm4X/v7N6MrJionc7ybGuFO7pg918vj7o7VhKwgM34rFmV?=
 =?us-ascii?Q?MDkdIiu3KHlyQV6oEco7tIxgiZhtcJLTN5hp8rxXGmYu6+FLSsQq0UomG/Sj?=
 =?us-ascii?Q?ZCtJsdlwsYRpcaSEiaGxxgnAbMz+YCCFg56EYIh+t786Wed4t3mvcwPWmdqu?=
 =?us-ascii?Q?G6ghZEQPrN09BCrjuqTnR2eDjqisRhxhgWymDFcJqfSZD30+KcrFJuxkvWMW?=
 =?us-ascii?Q?7I9yHXWI7b/Kdh3mRXorfFo+3vXVePDhPfdwE2sh6ytZn5EG9dd/211P1/H3?=
 =?us-ascii?Q?Af7r28uthINa8tdMbHmMbx5+aTf3vyJwq/1Mu5bLOwreX6THXnEwkhtOHmS7?=
 =?us-ascii?Q?o+6ag0cwXS2Pm5ANdC9g060MGuBZgtj2ssIM2vuQQdhLbm8Tis10YcHnBzQf?=
 =?us-ascii?Q?3JMLWYhtmSYmzXj8XP9h4UnSo0QpG9FIFg+zZlfK?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afa98a28-6fc8-4fbe-529a-08dbde9907dd
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB8690.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2023 07:21:44.7519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: apWeWEVZPVdO2UFB8DORcfMuTqwhRZcqLPlmnADT/zW0+xEg75GUNZR4bZBrSLmIPjClmvvdX1B9X0PTQGR6Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB8430
Subject: [virtio-comment] Re: [PATCH v1 1/2] virtio-gpu: Rename GFXSTREAM context capset to
 GFXSTREAM_VULKAN

On Mon, Nov 06, 2023 at 05:17:27AM +0800, Dmitry Osipenko wrote:
> Initially, the plan was to use a single GFXSTREAM context for all of
> GLES/GL/VK gfxstream sub-contexts. Over time the plan changed and
> GFXSTREAM context became used exclusively for Vulkan, while GLES/GL
> contexts were moved to a new own experimental virtio-gpu contexts.
> Rename GFXSTREAM capset to GFXSTREAM_VULKAN.
> 
> Link: https://lore.kernel.org/dri-devel/CAAfnVB=Mki1zEyjByJ_7tRrib74E4KSbjezqQcb_Uia8EQEXHw@mail.gmail.com/
> Link: https://chromium.googlesource.com/chromiumos/platform/crosvm/+/e4c1878733937042111fca58899a3a94002bfef0
> Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>

These two patches are Acked-by: Huang Rui <ray.huang@amd.com>

(Re-send, because just subscribe virtio-comment)

> ---
>  device-types/gpu/description.tex | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/device-types/gpu/description.tex b/device-types/gpu/description.tex
> index 443524851a05..4b8dd7733c31 100644
> --- a/device-types/gpu/description.tex
> +++ b/device-types/gpu/description.tex
> @@ -530,8 +530,8 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>  	the first edition of Virgl (Gallium OpenGL) protocol.
>    \item \href{https://gitlab.freedesktop.org/virgl/virglrenderer/-/blob/master/src/virgl_hw.h#L550}{VIRTIO_GPU_CAPSET_VIRGL2} --
>  	the second edition of Virgl (Gallium OpenGL) protocol after the capset fix.
> -  \item \href{https://android.googlesource.com/device/generic/vulkan-cereal/+/refs/heads/master/protocols/}{VIRTIO_GPU_CAPSET_GFXSTREAM} --
> -	gfxtream's (mostly) autogenerated GLES and Vulkan streaming protocols.
> +  \item \href{https://android.googlesource.com/device/generic/vulkan-cereal/+/refs/heads/android13-release/protocols/vulkan/}{VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN} --
> +	gfxtream's (mostly) autogenerated Vulkan streaming protocol.
>    \item \href{https://gitlab.freedesktop.org/olv/venus-protocol}{VIRTIO_GPU_CAPSET_VENUS} --
>  	Mesa's (mostly) autogenerated Vulkan protocol.
>    \item \href{https://chromium.googlesource.com/chromiumos/platform/crosvm/+/refs/heads/main/rutabaga_gfx/src/cross_domain/cross_domain_protocol.rs}{VIRTIO_GPU_CAPSET_CROSS_DOMAIN} --
> @@ -547,7 +547,7 @@ \subsubsection{Device Operation: controlq}\label{sec:Device Types / GPU Device /
>  
>  #define VIRTIO_GPU_CAPSET_VIRGL 1
>  #define VIRTIO_GPU_CAPSET_VIRGL2 2
> -#define VIRTIO_GPU_CAPSET_GFXSTREAM 3
> +#define VIRTIO_GPU_CAPSET_GFXSTREAM_VULKAN 3
>  #define VIRTIO_GPU_CAPSET_VENUS 4
>  #define VIRTIO_GPU_CAPSET_CROSS_DOMAIN 5
>  struct virtio_gpu_resp_capset_info {
> -- 
> 2.41.0
> 

This publicly archived list offers a means to provide input to the
OASIS Virtual I/O Device (VIRTIO) TC.

In order to verify user consent to the Feedback License terms and
to minimize spam in the list archive, subscription is required
before posting.

Subscribe: virtio-comment-subscribe@lists.oasis-open.org
Unsubscribe: virtio-comment-unsubscribe@lists.oasis-open.org
List help: virtio-comment-help@lists.oasis-open.org
List archive: https://lists.oasis-open.org/archives/virtio-comment/
Feedback License: https://www.oasis-open.org/who/ipr/feedback_license.pdf
List Guidelines: https://www.oasis-open.org/policies-guidelines/mailing-lists
Committee: https://www.oasis-open.org/committees/virtio/
Join OASIS: https://www.oasis-open.org/join/

