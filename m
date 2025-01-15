Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E61304C98
	for <virtio-comment@lists.linux.dev>; Wed, 15 Jan 2025 03:44:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736912684; cv=fail; b=AWFxH191jUSjPk7fe/0mL3RVCyQuo0Um+Ogomwx6m7JzYOr2dTgGr+vCkYjXPaVB9O4Ra6OS2rKIRW39HqYCC7jP/nPfSjrmm3FR8VvbpO8gPgMDCBx6uPAR2ZkrKTUjH9pnSujNaHf2HMcNxP3AO7Vy4Coo8byEE0iXwu4JoDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736912684; c=relaxed/simple;
	bh=HdjRDlcEuF/KFt8B+2xYwU+F0ahYiYsqRTB4Xo6QHsY=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=XFalpG0RaaoCZgZb4Rvvu+pf1SDtt6mbbjehoeJmPGrj1ZmL58sFEb6CVFukhEdU2cuBO+Xx9FZBilugX2twzFC5je2IiC0EZP/If9AVfgCPYlfDSsiZUztmQBwhqjVyQCACLSU9G4jHWe4fQ+2zaGOKgPaHm9WAJnPF9nwmO4s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=b6uyW27X; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="b6uyW27X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKuE9RUmQw6CZQGsFhMidBBiWfvqbGuX4ZiqL9rhTyb/vV7ba3RJmQ9ne5A53SQxiomiZHnoOREwTgYpzWVS/tJXJO6pA0VPTPJ9a/NfiOZghyqALJ8lwElHRiWi/kUWkJHU/4zMVIZfnb6Ep05sz5kt14BiECo0F1QkuqDJrgdPnyG8Z8ifoWj7QB3aVnDIc8X+ZHm/QVqlPzU/NEaZQtQ/CJJ6h4sbmB0cqsuC/H0XXW2KsZ0eOkcsk5eRcSguGScQf1f5uNzNuOfibVjgS7oXd8aoRdnFB8OomgBU7BNB3a8647+1pSQj1CbSCBkr6UkvMB5qXe9f1ogZTAI/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=izZQDOruaMesPQ7iFN79hUoOV1HMsDBQTtWz3djXlNI=;
 b=TewC8t52Lm+z/wJCosQIQGOMhhVVjs/djsseBVM68BMN4ZpOrrEaFVTlJUH2J/q2RKPVFlWtmelSjOLMsBNEYwr7z2mztC474bZMXY98D8C60XbGf+LAOK8seG/Dpk1jlg59VDrpG/L8tOmArv+FbhO91iKFuh7y1EjyYIKsZJ7XOzSEVWuMayZaXV0HnIoJtNaqvJibN4InRI6TfmEG3OJmXvUHZaYcdr0GQp9LppV7fTSpQBKPWreTJyjW58Jj8OZ4IjKSitb7Xo17KzWq4bYMBnnhA5o0v4jQROUiMndG1IYvV2g6RafIkiePM5eo3tWKQkZAqzNxMYaY2M9rXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=izZQDOruaMesPQ7iFN79hUoOV1HMsDBQTtWz3djXlNI=;
 b=b6uyW27Xgzqrmm6swhndGfjjpKlIqfOaGScuRn/NIhNjbBP9QAbvX7ru+QWtDpB1iCMJTa+tuV64mADa9x64cwHqtF2bfkWRAznYH6XVWC9F9HYk1o09vJxXo41Gof73YsOSmR7XuQOPt72qhHwNM43Ktln8xmyzC/xcJtKcpbW/OYkJ/5Nw0nLT9eE+5M0FFGhbtnxGHoVfDNu7Bcni8Sl2pNkJqZohQ0wrXU+E4/KY+iXRD0cq4fT1sLI2y3UfVJ7mg5P1OhtnxgnoNY+QAuu0M8qtNUtovuIBz1WmxUYekBYldtbGa/x21wtKeePvctjv3+j7Nlvnqp8keOnFUw==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CYYPR12MB8871.namprd12.prod.outlook.com (2603:10b6:930:c2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Wed, 15 Jan
 2025 03:44:39 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8335.017; Wed, 15 Jan 2025
 03:44:39 +0000
From: Parav Pandit <parav@nvidia.com>
To: Kommula Shiva Shankar <kshankar@marvell.com>, "pabeni@redhat.com"
	<pabeni@redhat.com>, "willemb@google.com" <willemb@google.com>,
	"jasowang@redhat.com" <jasowang@redhat.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "ndabilpuram@marvell.com" <ndabilpuram@marvell.com>, "jerinj@marvell.com"
	<jerinj@marvell.com>, "rbhansali@marvell.com" <rbhansali@marvell.com>
Subject: RE: [PATCH] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Topic: [PATCH] virtio-net: Introduce a new field to indicate outer
 network header offset
Thread-Index: AQHbZqgaFNqj/sEh/0yXSY3fnG9XbLMXMGVw
Date: Wed, 15 Jan 2025 03:44:39 +0000
Message-ID:
 <CY8PR12MB7195238886A179F2A16B6E70DC192@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250114171636.3175670-1-kshankar@marvell.com>
In-Reply-To: <20250114171636.3175670-1-kshankar@marvell.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CYYPR12MB8871:EE_
x-ms-office365-filtering-correlation-id: afedf4f2-c58a-4a4c-ee89-08dd3516f03b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?FqXB8bPdNdsafBlC1eFuMZ+xwCNqTvkXP5Scra8HYReHvuwYOfjZ5sSC0BV4?=
 =?us-ascii?Q?FLV3/Et5ne5e9Si7ZPDNMBJF85DnRFWHsCe7vwFtRmVKZ8qrLblbGf70ilXc?=
 =?us-ascii?Q?JtaND71N2J3OB+SavBwQtcfvJnaD+JoVnNkxtja0GgikOxnnwhqHudHdqLMq?=
 =?us-ascii?Q?LAanFHiG8Bw7aNGAoGbry8HK4bfxA9xdZagYI2C6b+VIlTPdwUkvA3cnidv/?=
 =?us-ascii?Q?T5CExhssQhrrlp7DjVS6I0picyXPI4Crak0TmqjfOAwmE8ohCLWQr2W0/WUZ?=
 =?us-ascii?Q?Z8wKx7jM4+ocb54ena8Gr9oVlc9GBDc2aKGEo2jaalMlW2uPVpuU6f8mA0GR?=
 =?us-ascii?Q?PK703xs5uykp5IW9klk0+13w6D83hXCdbWlG/+6LkWbRE3r1kLtLGX0kQLGR?=
 =?us-ascii?Q?RZnTwUb8pZxiQswfPbGVoqyqt9jUGG/WLGN5/kxtEQFR1cGtcZc53abfmrEU?=
 =?us-ascii?Q?6WU9l2UgGh3gG8B2PnY82s60yXMGVaPREbyOVMaJkEditcEpLqMFWoF9uYiq?=
 =?us-ascii?Q?MSBj2fGzF5Sgl8pXEdRJAKf2In/0cpGKtyJ86e0jeWa66o0dpp6yJfwunw+p?=
 =?us-ascii?Q?y2D3qUpbvKCZwJRw1JQxFA9NAEahA0hbO5KvXhCn1kwPUXptTdm0m7gCnLaW?=
 =?us-ascii?Q?NqSCjqb8giX5pOIetMNyNZj/biM4E9ttivbBqbSj2MBsDLUOQwLyyaMsWBSv?=
 =?us-ascii?Q?dM1Miu/pkMbrzcTXVD/eXuV4xRSYJ/0O5KLdbWWGBUbGX7oDVs4R3cOKxwiH?=
 =?us-ascii?Q?Z6ggoSvJAQ8L/cNC8EKO2bfI/lu/+LzOKaSvPgd8XrcZ0fYV9l2CO9fLP+Jp?=
 =?us-ascii?Q?oHAY9/z88hC0iwG7ZtRgy7CrKXtj3X4iPhSa3wRkgFdM0j78mpbwFli8ESpQ?=
 =?us-ascii?Q?Uijf4b0PweUcE6lDoWxCxlfyHKxkLSej7pxj4xjg0TdHNf/BqwaWR5CuoN0k?=
 =?us-ascii?Q?kbCMW4fkiyf1RSzuWMu5IlkbHHFruWKZwsPRCgsReSG1D8NrL08ITXNDV7Xd?=
 =?us-ascii?Q?yGd5ZiSbNsv7UstvPcVhttR+HOO+QYpHoZ1w8QVSu7mjV500d9K0bT4oCqxA?=
 =?us-ascii?Q?JetqJobPh69MocMKh5dMMEieHTw0achEkIwIYNhBI6W1JuzR+X0ebgLOO/SJ?=
 =?us-ascii?Q?dw28V3CVUurxtR1xXpQRTnDHTw6ZXSfdQ52yEfziTrNnreSC+IZUaMaMlruY?=
 =?us-ascii?Q?lseq9YwYKf8JtY95TKm6ljh9z39Roj3ykXJsO8LFqfYxsQ25zNN+yNN+WNhi?=
 =?us-ascii?Q?xc29JewZhVZZoOKbxCACXMOEPb67SFaLr2H3ue+eOB8vsdDN9RmOw25iu7rs?=
 =?us-ascii?Q?fgHX5Gyw3y1zcNsyJiwfzHsS7uIyOTsODqhKz+ukUyZ1FuptDcMNBSsnoKuB?=
 =?us-ascii?Q?B5MQcyb/fts6HTI4SH2A6o9TyXOQ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?gTWcVbnICiXTp40nyajKod0mVl9mOyG0ZIztGQTHOyNubc4jyPVqCNc7lTMg?=
 =?us-ascii?Q?JKMizNbiYpJtXJBqNzEnBMQKiAsrx87Dcqpr+eX3yVIvmliCaSW4uDAjGOq0?=
 =?us-ascii?Q?Pje1DR6N1M12NPXAJt0OcdV+y0678WpojUDBQY/pNRm2tWqX6jhGOCdSmfhp?=
 =?us-ascii?Q?LEguzvMOoGChn3Y3ZCaiCi6f4Y6lsrU82Z2MFyNNHQ875wFTCcUa+mjbTbaM?=
 =?us-ascii?Q?VHizoy1VL/OnpaDLd0aikmPbh/E2ACUmhQvIYXBFlevWhR5pq2hiEWLZ+cVr?=
 =?us-ascii?Q?HuV4Spcf5JuiFFj2HAYadcLLSw2bmKb3yFGekym254+C5M8OQWGBtKoYV0aD?=
 =?us-ascii?Q?lBT55F1xxTYJJ2v2IhNhKq9MIyO6xPWpTXulo8ZWuqvYxUdLAlwr5S+5HhoY?=
 =?us-ascii?Q?+E/L+fFvB10uqiJAHyLjBmgCYlOV3fLJnkbH5SXn92eDb/zRpS1xdkVx/ERU?=
 =?us-ascii?Q?lKODjab1GSeSwjhfysBjWWwOFbJcG/xukaVYXGdqcUalMDiqlxC27H32SeB1?=
 =?us-ascii?Q?SfqIP9GlL2FHmTBL3IsNUO9dkZJb8ZPao5eGTvP+pc8gNzMBs0w9HTrvJLgT?=
 =?us-ascii?Q?jPuP8Z/5a5sPouzAQsXCqOmnRZSDb8UtHWaw/Yw1NhbwRBhRrYecY2AvUC+o?=
 =?us-ascii?Q?v6Abo46G4ldiW4U5Nr8bci/arwXrozMzzcA1nIdqvTyGsoyjgBcUJcGGO/Sb?=
 =?us-ascii?Q?hZcjHAhwBOCK6Ru2aZsN9NvtmBxezSgMtXCKFfqkdVsLR32au/YcjOm72fh5?=
 =?us-ascii?Q?d+BE+Q9bT3iodQZN8blDSnYIoeCcCSyARclZf+TPhOBca8H6825A2vdIloej?=
 =?us-ascii?Q?Ylu0ebP5KSQLTL+bkKPi1MSpOtdXUu514MuWUGHkQdqwq+dCNObq1Ki2uGbI?=
 =?us-ascii?Q?ck7fNKHIkADLG64iRyBiezFatBnEoDYL94CjfzgSbjg7WAESu9doDib6SWGa?=
 =?us-ascii?Q?kyU9xcL+qJf3H/SHwu2tPSnYFCE6SQLsq0n3MU02nls32azVlNcPv+lo0KaA?=
 =?us-ascii?Q?3ZoeOFnTCiHwycrbiCBVrBLxjLT9XIpVCy7pkoX09Bhxzs5cSVhIpffOhqH9?=
 =?us-ascii?Q?ub1Xuw/B50tYtikeAXdamUSPKjHpyudq+6/+6FYqjc0ViN+pKYaeuihTb7I/?=
 =?us-ascii?Q?SAAYL7Lf8ZRpLFr14X5YohLNdl5NkS8jGQCVk1PXgcQF91vqKqPTFlfYRHB+?=
 =?us-ascii?Q?MSNCwnNvjgo5IqISgD327GRF8dY0xko78QQoZoWqcRR/vAwaC/3V342jp4QK?=
 =?us-ascii?Q?KJL3zIdEKgQghLEi5E6opWKlFXbi4MsbKzA8c1VXrVr2jlS9jhqof/3D+y2L?=
 =?us-ascii?Q?qQCadJGhuSftWpAXeHw5n6pFoqbvXXc0YjYOG6HrLRVHIyi+99qk/rc14PLD?=
 =?us-ascii?Q?GjSws45StCJGw97RwU/8qxPGm5044YQiIn64bbQqkARRZN28Zi8A5LsJy+vk?=
 =?us-ascii?Q?VkD3Iw8ptXcsbCSDRP8CTbO8FMqAAvcUlE5knBGu5CLPUcYjiFzHgVRyDgx9?=
 =?us-ascii?Q?gvHklqAzc9pw0/hPj7vmRphm7t9sQxAp9DriLalO3e22fzq6Fqt4n5qDAhuE?=
 =?us-ascii?Q?pJCbWUfOWm/Zm3MIxsk=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR12MB7195.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: afedf4f2-c58a-4a4c-ee89-08dd3516f03b
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jan 2025 03:44:39.2130
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AGujuivXSJwPYLo4xXSqS55mw3K4DrjBztfQ4kvGGBc0KhqlbYFUiyYJCM4Ibw7m2ET9UnYCJ8sboVP0Qo3NlA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8871


> From: Kommula Shiva Shankar <kshankar@marvell.com>
> Sent: Tuesday, January 14, 2025 10:47 PM
>
> Hi Everyone,
> It has been some time since this patch was sent. I am resending it for yo=
ur
> review and look forward to your feedback.
>
> This patch introduces a new field in the virtio_net_header called
> out_nh_offset, along with a new net device feature,
> VIRTIO_NET_F_OUT_NET_HEADER.
>
> Currently, there is no field available to directly read the outer network
> header offset in case of segmentation offload.
> This requires reading packet data, which significantly affects performanc=
e in
> datapath.
> Additionally, some hardware implementations requrie knowledege of the
> outer L3 offset (aka L2 length) for inline IPSec hardware acceleration.
>
> To address this limitation, we propose splitting the csum_offset field in=
to two
> 8-bit fields named csum_offset and out_nh_offset.
> The csum_offset indicates the offset value from the csum_start and  may n=
ot
> exceed 256B bits(2^8) for protocols that use a 16-bit one's complement
> checksum
>
> Following table lists such protocols and their checksum offset fields wit=
hin
> their headers
>
> +-----+--------+
> |Proto|csum_off|
> +-----+--------+
> | IPV4| 10B    |
> | ICMP| 2B     |
> | IGMP| 2B     |
> |  TCP| 16B    |
> |  UDP| 6B     |
> +-----+--------+
>
> The out_nh_offset represents the start offset of the outer network header
> from the beginning of the packet data
>
> This issue was briefly discussed on the mailing list in a different threa=
d, which
> can be found here
> https://lore.k/
> ernel.org%2Fall%2FDM4PR18MB4269FAAC3CFC7E57E25DFBD2DF8B2%40DM
> 4PR18MB4269.namprd18.prod.outlook.com%2F&data=3D05%7C02%7Cparav%
> 40nvidia.com%7Ce81096db39a14378627708dd34bf3909%7C43083d1572734
> 0c1b7db39efd9ccc17a%7C0%7C0%7C638724718122375976%7CUnknown%7
> CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiOiJ
> XaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3DTH
> SOD9fclucwxtnizGLo8pIpjsTs1YoRww4VA%2FvDwgI%3D&reserved=3D0
>
> Signed-off-by: Kommula Shiva Shankar <kshankar@marvell.com>
> ---
>  device-types/net/description.tex | 26 +++++++++++++++++++++++++-
>  1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/device-types/net/description.tex b/device-
> types/net/description.tex
> index 76585b0..48c081b 100644
> --- a/device-types/net/description.tex
> +++ b/device-types/net/description.tex
> @@ -88,6 +88,10 @@ \subsection{Feature bits}\label{sec:Device Types /
> Network Device / Feature bits  \item[VIRTIO_NET_F_CTRL_MAC_ADDR(23)]
> Set MAC address through control
>      channel.
>
> +\item[VIRTIO_NET_F_OUT_NET_HEADER(50)] Driver can provide the start of
> \field{out_nh_offset}
The driver

> +    value. Device gains advantage by not reading packet data to calculat=
e
> outer network
> +    header offset.
> +
The device

May be just say 'packet' instead of 'packet data', because its slightly con=
fusing between packet L2 header and packet data in this context.

>  \item[VIRTIO_NET_F_HASH_TUNNEL(51)] Device supports inner header
> hash for encapsulated packets.
>
>  \item[VIRTIO_NET_F_VQ_NOTF_COAL(52)] Device supports virtqueue
> notification coalescing.
> @@ -418,7 +422,13 @@ \subsection{Device Operation}\label{sec:Device
> Types / Network Device / Device O
>          le16 hdr_len;
>          le16 gso_size;
>          le16 csum_start;
> -        le16 csum_offset;
> +        union {
> +                le16 csum_offset;
> +                struct { (Only if VIRTIO_NET_F_OUT_NET_HEADER negotiated=
)
> +                        le8 csum_offset;
> +                        le8 out_nh_offset;
> +                };
> +        };
>          le16 num_buffers;
>          le32 hash_value;        (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
>          le16 hash_report;       (Only if VIRTIO_NET_F_HASH_REPORT negoti=
ated)
> @@ -457,6 +467,10 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \item The dri=
ver
> can send a completely checksummed packet.  In this case,
>    \field{flags} will be zero, and \field{gso_type} will be
> VIRTIO_NET_HDR_GSO_NONE.
>
> +\item If the driver negotiated VIRTIO_NET_F_OUT_NET_HEADER,
> +   \field{out_nh_offset} indicates the outer network header offset in by=
tes
> +    from the beginning of the packet.
> +
If the driver has negotiated

>  \item If the driver negotiated VIRTIO_NET_F_CSUM, it can skip
>    checksumming the packet:
>    \begin{itemize}
> @@ -531,6 +545,10 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  \field{flags}=
 to
> zero and SHOULD supply a fully checksummed  packet to the device.
>
> +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, the
> +driver MUST set \field{out_nh_offset} to point outer network header
> +start, otherwise to zero.
> +
Need to make it more verbose that, only when there is L3 header.
If it is some packet that does not need L3 header offset, the offset can be=
 omitted.
I believe we need a flag bit in the vnet_hdr.flags to indicate that header =
offset is valid.

>  If VIRTIO_NET_F_HOST_TSO4 is negotiated, the driver MAY set
> \field{gso_type} to VIRTIO_NET_HDR_GSO_TCPV4 to request TCPv4
> segmentation, otherwise the driver MUST NOT set @@ -596,6 +614,7 @@
> \subsubsection{Packet Transmission}\label{sec:Device Types / Network
> Device / De
>       the driver SHOULD set \field{hdr_len} to a value
>       not less than the length of the headers, including the transport
>       header.
> +
>  \end{itemize}
>
>  The driver SHOULD accept the VIRTIO_NET_F_GUEST_HDRLEN feature if it
> has @@ -610,6 +629,10 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De  If
> VIRTIO_NET_HDR_F_NEEDS_CSUM bit in \field{flags} is not set, the  device
> MUST NOT use the \field{csum_start} and \field{csum_offset}.
>
> +If the VIRTIO_NET_F_OUT_NET_HEADER feature has been negotiated, the
> +device MAY use \field{out_nh_offset} as the outer network header
> +offset, otherwise device MUST NOT use the \field{out_nh_offset} value.
> +
>  If one of the VIRTIO_NET_F_HOST_TSO4, TSO6, USO or UFO options have
> been negotiated:
>  \begin{itemize}
> @@ -631,6 +654,7 @@ \subsubsection{Packet
> Transmission}\label{sec:Device Types / Network Device / De
>       \begin{note}
>       This is due to various bugs in implementations.
>       \end{note}
> +
Please remove this blank line.
>  \end{itemize}
>
>  If VIRTIO_NET_HDR_F_NEEDS_CSUM is not set, the device MUST NOT
> --
> 2.43.0

