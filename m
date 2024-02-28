Return-Path: <virtio-comment-return-9162-virtio-comment=archiver.kernel.org@lists.oasis-open.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from ws5-mx01.kavi.com (ws5-mx01.kavi.com [34.193.7.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F3EC47DD9
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Feb 2024 18:15:48 +0000 (UTC)
Received: from lists.oasis-open.org (oasis.ws5.connectedcommunity.org [10.110.1.242])
	by ws5-mx01.kavi.com (Postfix) with ESMTP id BDD8971C8C
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Feb 2024 18:15:47 +0000 (UTC)
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 9A44B9865CD
	for <virtio-comment@archiver.kernel.org>; Wed, 28 Feb 2024 18:15:47 +0000 (UTC)
Received: from host09.ws5.connectedcommunity.org (host09.ws5.connectedcommunity.org [10.110.1.97])
	by lists.oasis-open.org (Postfix) with QMQP
	id 78F2398645C; Wed, 28 Feb 2024 18:15:47 +0000 (UTC)
Mailing-List: contact virtio-comment-help@lists.oasis-open.org; run by ezmlm
List-ID: <virtio-comment.lists.oasis-open.org>
Sender: <virtio-comment@lists.oasis-open.org>
Precedence: bulk
List-Post: <mailto:virtio-comment@lists.oasis-open.org>
List-Help: <mailto:virtio-comment-help@lists.oasis-open.org>
List-Unsubscribe: <mailto:virtio-comment-unsubscribe@lists.oasis-open.org>
List-Subscribe: <mailto:virtio-comment-subscribe@lists.oasis-open.org>
Received: from lists.oasis-open.org (oasis-open.org [10.110.1.242])
	by lists.oasis-open.org (Postfix) with ESMTP id 6A2F5986478
	for <virtio-comment@lists.oasis-open.org>; Wed, 28 Feb 2024 18:15:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at kavi.com
X-TM-MAIL-RECEIVED-TIME: 1709144143.999000
X-TM-MAIL-UUID: cb8aa903-350e-438c-99d2-c29586c3ecf1
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BJvI5eSld5YISY4e50VA8YwnG946DIHo6xkCq9mqgK50bKMoCO+JToF9G9CEfCwBW1cA0UpOgyzpD0ut/nrxqeUkkpFVwxxEceSSlKyAG0Xaot5KPTDTiN3s0UIYzJRjt25GBlNNwYqdDZ28aWjAWkZHfT72px8iMEBCtcBGuWfNwijiCArQNzNMHoDz7cNVwR9sT4floXxydTNnSHkWzc0qfsMskRX3OiRs681PvdWBXN8KihVzJcVWMDd942XgKduB8oZsmLJDnzVAVgvOYqBx0YYBED3/3PQfa3dRZuDFTjkm0PAbE/rx26jLQeLFOUP1XEvoUUtz9+Eo4Ct2Mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sQa0nQHZNEqdENfI8HdXuc2nmQc6xp6vze8UucKUusY=;
 b=gsXVC5s/IzYmrbmtBJJ5d+XZCkita3Vl5D273BNY7g9olgycDz9fgeXAOIpOqAeRJGxq9TKm1KHpsMytW5+THzBfXmvI78A4Xflr/c18/DAPvSBYYEW/4lHlaf01fbwKD4beigeVwfPXMCPdetQE5l2qrOCBwDko+AFy+RvmOloYoUvaKXzKjt9DdPpfyFgYpsNBNimaaErdN8g1uN59B/4QLW/iNIdkTxSo/zcZUUNMEqwAZBLozChzUnwTRT21yOP91PN7FjQ/smqWANRMOQ2vbfjADie1rfQ4xku+yd4oUb4gU09cDsQSc4t602p4HtI7OQqNwXQs80G4ENgJAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=opensynergy.com; dmarc=pass action=none
 header.from=opensynergy.com; dkim=pass header.d=opensynergy.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=opensynergy.com;
Message-ID: <17d6675d-f084-4570-97fd-e9a4ddc7c5c5@opensynergy.com>
Date: Wed, 28 Feb 2024 19:15:41 +0100
Content-Language: en-US
To: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>,
 virtio-comment@lists.oasis-open.org
References: <Zd9cMvuPQ8VxKOXY@fedora>
From: Harald Mommer <harald.mommer@opensynergy.com>
In-Reply-To: <Zd9cMvuPQ8VxKOXY@fedora>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0262.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::6) To BEZP281MB2581.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:2a::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BEZP281MB2581:EE_|BE1P281MB3237:EE_
X-MS-Office365-Filtering-Correlation-Id: 375e7bcc-dade-4287-6715-08dc38894686
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	GnA9qKivKF5GeX085cdw3M7+w3Y1YUZqpw6to3IpUMR9Jq3MpzrKznZx6ytACN0H7SmY4LFSpuP1Azb8oFSdtRBLpXGOpzHl53ypzSDxXftk8W/wauwadFaKFYxUAPyrttlTKqC1AN9dYpRDczJ9o8X3wHd0UTV83hTCU64AdsK2H+TtwKOSIoIJyFbDndvJDH0PJ36JJM/IyLbPzHJGkUk+8s152WOr4SMel4fKLhhFdrINAzgHEFZL2FGA+fFW90sapZUd7DSUWJdYp3Eel1dCyK5KlgemWDxcLlOWp2kJbC4wZjXrnvbMa7FHFTc9tVPqckVZ9nsnPmRlHkboaLFsZHclUA1UGzUNyRkm09aZHx2lyIxtCQqnCkZXnY4vuRMydBo7mzGomU1xDGFs2ouZz/lqmdZCe001KZddddafdM927UsqHJrw2idV5vc8IHUn6nXlcLyHJL2vRh4l7k7CNAIFDBn1hxPLm35DnOyrkGybWoizJD6QsxTay5CS0ZZdhbCj+mnWpVT/uyhD5as7PgO5GEQu9/Zmf8A85LyVYteszSk1aGbfX59CfnYCVUKB90+jgVa8QCmMSZ02H+nS7VB4325+73Y2i6H0LERvM+E988W9A++kCXk0YC3R
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BEZP281MB2581.DEUP281.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230031);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tk5pVDlrVVpjTi9hcXlDaW5KRGFMSlV6WFh3c3c1V3crUXJaMjhiQTV2MzB3?=
 =?utf-8?B?YTd3MWRwS1NTRFd4VHg1TjNpRHd6NmhYL043WDdmMzZnZng0YU44NmlQRVZW?=
 =?utf-8?B?eG1CZSs0ZlhtNEFHTllZMXRhWmlrUjc2NEVjNkJ5eXRKb25IQUM1WEZtS1JJ?=
 =?utf-8?B?L3EvOHZjTzlYQkJyMzQ2cm9WeExmenFjUVlTTnRlSVJsQzRtMjNpdFZUSHU0?=
 =?utf-8?B?SGwya2pqZVhrRGdCQktndUdMcmNSZlMyRXVFa1hoSUVlaVNJMDEzU085NUJK?=
 =?utf-8?B?OU94bEJTZ0Fra3EweG9IRDdsaW42L24vVGluS3VFUkdPcTI1V2hWbkVjMTRz?=
 =?utf-8?B?YjZJa3FKUm5pT2VUZU1INE5wTHhQODF5Z0hQL2c2US96aW5kdVNIZFFCWEdp?=
 =?utf-8?B?WmMrem9aYmRZazQrMVpyd0gvVmNHRmNLZ3ArSXpoTEtoTzkyRktCRHozZWk1?=
 =?utf-8?B?d0EzTk1zdW9ZdllpbWVoSjFEcXJYc28rYmFVV0hzVkVQbUtEZ0NmY01XZ2xv?=
 =?utf-8?B?Q2ZVaThrVDFuZjNNZStJa0djSFozUjRieGo0eUtvMitqMDdETUI2cy9HRzdR?=
 =?utf-8?B?cDFFMlh4eS9TdENicUl6WkFnVktwQXI2ZG9UNUZ0MmlXNncxcFdhaGRQMHI0?=
 =?utf-8?B?OW1IdHZqTEFub1hlZi9kR1BHVDI1VThtVldZM2tQeW9sTlphdmVRcXdKVElH?=
 =?utf-8?B?WWdlTXM0RW1BVk9Kc2h5ZVY1MFhIYU55QUZVL3lud0lzV2lHQlJjSnhZUXIy?=
 =?utf-8?B?YjdSMk1BNE1takhqL0pMVXBRaGxVSmdzbFJTWlZRQ0JDVDJyWGdxRHBSNFBu?=
 =?utf-8?B?clNueDQycld6MVdCa2F3ckZhMUsvbGV1YXpDOGM1RUFQbTZvb1kxZ2R6cG1w?=
 =?utf-8?B?NjlKcmVJOUVuZERJQXphWkdxZndxOUNCb3NoNHg1a1R2L2JpKzF6ejVNdTJZ?=
 =?utf-8?B?Rk9oTkg3R3FFZ09PMExpNlZuTGUyT1NhbFJRY1R3VEpMNFhJUTl4ZU9uUEV1?=
 =?utf-8?B?bU9uVmFPeEVublp3Vk5LR2ZzQVI5bGZDTTBsUjM3alFmbVVzWVhaOStTQ2I5?=
 =?utf-8?B?bHRqemJZS0h1SWF1ZzBvRUxyT2ZRby9uc3QxV2xndWhMOXlnQmVNVmRWc0dl?=
 =?utf-8?B?dXd2WGVsS1ZLZG9zK1JrejB6TkphZXAwK3F2NEYwNndSTUQwZFNLVkFEL0pX?=
 =?utf-8?B?RG9HOHhJZU5EdzhRcCtjSDRHa0V1L3VoUTRWdjloTnJQYnF6VEFHUTV6czZN?=
 =?utf-8?B?cUFMUFl1aG41aVp2eVAraVlwTk9Mb3JBU095STBTbzdURjFrVDVNNmlVOFEx?=
 =?utf-8?B?MlMzdDhCdzBCMmpWZ25pVFRldWE2VlZVSEJTSEUxeFZqUjZoVkptQXZwWTB3?=
 =?utf-8?B?NGZrYkN3bW51NEFXS09YVDVKUHRZajRYemhBSGRqdHBUTGVUWk93c3paZlVL?=
 =?utf-8?B?NVdnV25rWjh4bjRIV2xzLy9NQys4VHI2UkZGVkkxeXdkMjRaZExZeVo0NFEz?=
 =?utf-8?B?S0lMRTIzdEhzYzJENmZ3QmxFQ0toVDZienpNSEFqODRIUnBoRzVjSmdQaHNz?=
 =?utf-8?B?MzFPZWNtQ1puT3d2cElqTGYzL3pPaVV1dlBGTUt2QVBFclRlT2hGdkZRWDBW?=
 =?utf-8?B?V01wZ0dFRnc1eHZKZlp6NzByZWJYQkYrdUMreWFVQ0ZobVZ3Ylc5WnJ0akcv?=
 =?utf-8?B?YkdvdmFzY0g0RUdzaEdSbkFMMVJ4Y01PRlBHN0hPSnQvdVQvV3Q5a1BZdzlG?=
 =?utf-8?B?RjRJZVFDQmhDTlRjeVdWWDlDUStvWlg1NlFSZEI4WGFZUlcrV2JlcnoyRnoz?=
 =?utf-8?B?TEMwU1FMd25DUSt0WjdrRjNkajE5OG4yZGhGbjd2OS9PTFpjbzN4SHNoYzgy?=
 =?utf-8?B?OTlpbm5nZlNkQnZ1K0lmaWQ4T0VSQnZtL1YyM1dFN2YwcmQ4T1A0QlBmc3l5?=
 =?utf-8?B?WFBsSTlOVjVaaVpveUttVHFaVVNJUlBvcUVYZ3UrUmdtK1EwbkdPZ3pQR2s4?=
 =?utf-8?B?c3hDZEdQUUtvS2I4U2RnNWpEcEFQR2xQcDhBb1kvOVhWVjFtQWJvNk1qbytC?=
 =?utf-8?B?aUd5MVFHRUN6U25RSlJGZmNnMEhVd2xBdll2K1JGdjdlYXp6SXROVlZPK3Bt?=
 =?utf-8?Q?BSPHUcvc0gWIy+WrYksIVQLyB?=
X-OriginatorOrg: opensynergy.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 375e7bcc-dade-4287-6715-08dc38894686
X-MS-Exchange-CrossTenant-AuthSource: BEZP281MB2581.DEUP281.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2024 18:15:42.5625
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 800fae25-9b1b-4edc-993d-c939c4e84a64
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l6U34iWbCqsrhj83cbZD6LPkfxCZzKiiim3bON5e16aCGIxQWWOSzS6IZn4SNWu77Vsh4YDf0aACe7HFIdhIIg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BE1P281MB3237
X-TM-AS-ERS: 104.47.11.169-0.0.0.0
X-TMASE-Version: StarCloud-1.3-9.1.1015-28220.001
X-TMASE-Result: 10--12.551600-4.000000
X-TMASE-MatchedRID: u7Yf2n7Ca/1TzAVQ78TKJRhvdi92BBAuUd1JKREWJmR4qfOd233bZc8S
	SyAROkr3Bf+oLr2yQk1bGYt3vomiyzURLmZdK2fKRg15M/AO3Y/c7b6k5+X69zAsn09lQFCFAxH
	TB+c38up9Xqwfj79e2oDw7ZMKld/Bx5yOAL3addCgbRFHRBZMHjoK7X1W2DKDHyNEnetUnYKIeE
	4MP8chfOLibDUSUM6Cjb8HgOeu95FiqdmaqPt35eT5AnjO7TXtDXFap8thawEweIyZbRlQ24XrN
	S+xKlbqsQO6Vch/CfaNfczRoWaFQ7DP95vZKN8o3a10vAUaMQqoENw5WsYKM7C66pzjxPrrJU0n
	G3tpe+CEbaqKQSlAZTKi+HUKFjEiVP02sUaPeRSTV794sV3abKGtlYnNFLGaHuWZkBo/Lo8=
X-TMASE-XGENCLOUD: d80a9df5-bcc3-43bd-ab26-c6e4bdd8c45f-5-0-200-0
X-TM-Deliver-Signature: A5C1DE92DEF15FECC2EC1564E6C29708
X-TM-Addin-Auth: 0aF9emwq+QrYyTWyztCQ2ZkhOdjGTm9ISoXN7HYLoewzABVyYdzewX4gLWl
	FykxPGatfxmxzMGo2AHMfD/r2NU7OIgi9qpfzBZyZsuOfoJAy1lDOThJ3+PvNJ/kAsYjBwIS/WE
	r7UJuC0JyaQwjX79qbZend+vTkzEwhZrcFwp5OSSBhhyLk5jBRwsteddpDDZKZJOpHlOdGH7oSS
	boVK8Foghq7C4JGFbJKLQwPokA9iWC33e0QdaRUCHSUQAbXKjj8Vh0fgm26P2cZwrl0AORZt59T
	sQXuEaNQSr2BCAQ=.lP7zN5sGtFyp99GnoOg7qigPg1fLrFz4E8/4mysiRF/m7BuDN8UqgaF4Ie
	FdFqp4mN2G6xwZIhmPdrqvEG+znfxJvp44ZdiZwjamp6Rk9UCxPT839e5Hb0M7U/PfaEx77xoOx
	zmoYrCQcQiaVDsgd+3nfd3BvDAjOpx/G0czkOqNYw6iQa2Eclf/NDO6bQqXETABxQy/dtBRxgKp
	Zfr9axtfS7VAsMoyHDk0zAHuRtpkmNSSlOzodPI7bLzZ4HmgyiRiZ0+gOWqyPWBYJCEQ9SwWRIU
	jY/Oge/2SdSc3UH3kMYS0tNXBOvpTRoH3BC2FFjk0dp7M8PwEgKHinXzEtw==
X-TM-Addin-ProductCode: EMS
Subject: Re: [virtio-comment] [PATCH] virtio-can: define out of rage can-id


On 28.02.24 17:15, Matias Ezequiel Vara Larsen wrote:
> This commit explains when a message is out of range.
>
> Signed-off-by: Matias Ezequiel Vara Larsen <mvaralar@redhat.com>
> ---
> * This patch applies on top of virtio-1.4, which has not been released
>    yet.
> ---
>   device-types/can/description.tex | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/device-types/can/description.tex b/device-types/can/description.tex
> index 2511d9c..0a5cf02 100644
> --- a/device-types/can/description.tex
> +++ b/device-types/can/description.tex
> @@ -191,6 +191,9 @@ \subsubsection{Controller Mode}\label{sec:Device Types / CAN Device / Device Ope
>   invalid state with VIRTIO_CAN_RESULT_NOT_OK in \field{result} and MUST
>   NOT schedule the message for transmission.
>   
> +Note that a message is out of range when a standard frame uses more than 11
> +bits of can-id or when an extended frame uses more than 29 bits.


"_" and "-" and missing \field{}: It's "\field{can_id}" in the paragraph 
above.

=> "can-id" => "\field{can_id}"

Looked through the spec. I did at least not totally forget to mention 
the 11 bits for standard CAN and the 29 bits for extended CAN (line 
28ff). But could have been expressed more clearly, the note makes it 
clear now.

> +
>   If the parameters are valid the message is scheduled for transmission.
>   
>   If feature VIRTIO_CAN_F_CAN_LATE_TX_ACK has been negotiated the
>
> base-commit: 37c6a406678a5ee891fdf5671298cb4fcfa517f2


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

