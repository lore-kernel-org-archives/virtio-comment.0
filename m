Received: from mx0b-0016f401.pphosted.com (mx0a-0016f401.pphosted.com [67.231.148.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB4E2C80
	for <virtio-comment@lists.linux.dev>; Tue,  4 Jun 2024 00:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=67.231.148.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717459895; cv=fail; b=bkpAHZgCVixi9coHghIRY/VFpuq5Z2/tyCshqwAuHeFJhvsJcDLesuxx0ks9mND6bkY3mob9H5OEGCJi1TrJROw9DEKijffcniztsLQ1gfoU1PYcNMcXhTgKlX8f0EWzWJP4q2tr/YSRzxCshjPAJtNtVarLcGwj4LGsbofVreM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717459895; c=relaxed/simple;
	bh=lv6ithlpjuvy58gKqT98pWzuzsAzkdiiiFL3bxv2Xuo=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PhOcEMvqOI9U/YpFCoQ23099/Imm9Zti2E6QDpOOuemzc4HaikLi8LBNt84HG2QMGlrvqXZqyPKG3A5+4qAJE1CZLUjr1q7Q68BQmJEdf8rdhqtoQLi5fsNH68j3AZil5P03yQ8XWXTXi7Pf+A81MDsmGDntV+uEauHTytFeUB0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com; spf=pass smtp.mailfrom=marvell.com; dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b=Im68r5KC; arc=fail smtp.client-ip=67.231.148.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marvell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marvell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=marvell.com header.i=@marvell.com header.b="Im68r5KC"
Received: from pps.filterd (m0045849.ppops.net [127.0.0.1])
	by mx0a-0016f401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 453IpHGL006650;
	Mon, 3 Jun 2024 17:11:28 -0700
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhb3wav4r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 17:11:28 -0700 (PDT)
Received: from m0045849.ppops.net (m0045849.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 4540BSmF013988;
	Mon, 3 Jun 2024 17:11:28 -0700
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2047.outbound.protection.outlook.com [104.47.66.47])
	by mx0a-0016f401.pphosted.com (PPS) with ESMTPS id 3yhb3wav4m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Jun 2024 17:11:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ydo3EDZJmYUnJtjTBPblcUZSSToikqkDs9WdTwKC/nFMyMBnazqA5heJ+QdCM5mVXxusyyzhmA0wNGGNYN7v7pzlgi0eyuSMbrQz8SDcVw1sD4hiw2Pylb65gld8IT6YzMnH9NNUeo+wHZSgCRVagD2Luzb/AqQYIN6eCoVrOixe6o7vMkuevMDaGW3oYUds0Y7FRR++w1fuziWZhBqG/j7KsXBEMSFydEwEtDYebtpsir+QAQiuLTDKQFg13piMcUMckCH74N0m2kCv6LGUfSmbCXJFUbMrFakanda8KAUMo2HSm/mMz9geBMOlAlZ+8GnfNy4HMqjY2Zpmbr1s1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lv6ithlpjuvy58gKqT98pWzuzsAzkdiiiFL3bxv2Xuo=;
 b=GCDopDFWXazJc2CCfDg7tOhAF10vgyiJdFj5XKwx5JUUF0N9wjZr55n1dWCZ4zQkXAAFrlvAi8GzQgoSvWBrB1dySDiAsWLB+Hvgh2xe7PlOtlpzaJUDEFOrwrObQ+haHTreEo3BErdiflYIIDZzDuWt7TNOHEFKIkMIm3+GpwMQ2GQajqKa6D6DzONH/dwuVeZ8cs/O7TNCXZq7QcKj5vx7Xxpf7dv/5uary+R/jdk/UvnHs2auriAmfzjAiJgY56c05JdovFwwQcocedxe0lTTLj8oVHbfoIPdrqtq9A0PX2r8enRYJMF8LOFjMgXbTbfodhhAB+5sewsMXfhKTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=marvell.com; dmarc=pass action=none header.from=marvell.com;
 dkim=pass header.d=marvell.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marvell.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lv6ithlpjuvy58gKqT98pWzuzsAzkdiiiFL3bxv2Xuo=;
 b=Im68r5KC/MMCwfraDXAqtreTgcY+4vy+s0DZcFbpzPgcamb51JYggrDjRHLauHnYhWnWD9SCvzTu9yiUe37612RxGoH/gTpLRA1rc3XevrPP/6HSpFDo4Fk0ZDqbxuS/Zo+QEySgI1UrBvuIAm0l3WPzQmAvdda/GZ6WvvU6TbI=
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com (2603:10b6:a03:304::23)
 by PH8PR18MB5309.namprd18.prod.outlook.com (2603:10b6:510:238::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.22; Tue, 4 Jun
 2024 00:11:24 +0000
Received: from SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b]) by SJ0PR18MB4477.namprd18.prod.outlook.com
 ([fe80::7c90:e416:9ec6:583b%4]) with mapi id 15.20.7633.021; Tue, 4 Jun 2024
 00:11:24 +0000
From: Satananda Burla <sburla@marvell.com>
To: Parav Pandit <parav@nvidia.com>,
        "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>,
        "mst@redhat.com" <mst@redhat.com>,
        "cohuck@redhat.com" <cohuck@redhat.com>
CC: "hengqi@linux.alibaba.com" <hengqi@linux.alibaba.com>,
        "shahafs@nvidia.com" <shahafs@nvidia.com>,
        "si-wei.liu@oracle.com"
	<si-wei.liu@oracle.com>,
        "peter.hilber@opensynergy.com"
	<peter.hilber@opensynergy.com>,
        "jasowang@redhat.com" <jasowang@redhat.com>,
        "xuanzhuo@linux.alibaba.com" <xuanzhuo@linux.alibaba.com>
Subject: RE: [EXTERNAL] [PATCH v10 10/13] virtio-net: Add flow filter group,
 classifier and rule resource objects
Thread-Topic: [EXTERNAL] [PATCH v10 10/13] virtio-net: Add flow filter group,
 classifier and rule resource objects
Thread-Index: AQHaq3rAVXkbmkAEf06K/iFN+0EGWLG2ygqA
Date: Tue, 4 Jun 2024 00:11:24 +0000
Message-ID: 
 <SJ0PR18MB44772B48F7132C629586B6FEC3F82@SJ0PR18MB4477.namprd18.prod.outlook.com>
References: <20240521122937.2004180-1-parav@nvidia.com>
 <20240521122937.2004180-11-parav@nvidia.com>
In-Reply-To: <20240521122937.2004180-11-parav@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR18MB4477:EE_|PH8PR18MB5309:EE_
x-ms-office365-filtering-correlation-id: c64e4dfe-fc1c-4822-8eac-08dc842adec4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230031|376005|366007|7416005|1800799015|38070700009;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?c34MejeCqnHyFzoIxXLCoss5gzZc1D+LR1GRecRRgdR7P2ryqjDMBPZUfpli?=
 =?us-ascii?Q?iDv2k17Vz9OQVxlUu6U6TqKHsxsyj5bcQD+IgJSiwkPSG775oGWO8bu+yI8C?=
 =?us-ascii?Q?62mIm7GUzAVZ3t+sy+XHaxIAM371jcim8kkb3Z5PhcvQIBJ+CtKesDt3UHpr?=
 =?us-ascii?Q?xcLXF1Rk1lYCKbDnK+jijeMCemNrnBCAhMfy8hnn414WCg90AOPXGbOd+HN2?=
 =?us-ascii?Q?ihoK9zHuR31NYyTq5fC5C1usN7z/eUeHDiLkyZHKoeQIlMh87GoLB2CGPeJZ?=
 =?us-ascii?Q?BNdHfnqo4HhZM6KAygVN4xIdbLZ77P3huOijPDvyei1q0mUDFrk1BbIyyvmn?=
 =?us-ascii?Q?Am7clz471XJ+jNcQqvjaEjUx7xAS3PH+G7aDOOYXxKQ/7NvyynTkU1qZElmJ?=
 =?us-ascii?Q?I9YDLURb+jsOQinSKCsf+VnjibeMCIBWzpGyhtEOP6SzxF63fHTmt8gsiPXF?=
 =?us-ascii?Q?TLFb1HypFxBBOG03QrJhSRHO2/pxgxaml+76kKkBS1zWEX9oXj/jf33hTzTC?=
 =?us-ascii?Q?urznRELcD4fI2Uynhi0X5hnNFkpEGUySUJuj5s605Akv5ALG5IZ+nH+7VN8O?=
 =?us-ascii?Q?MztGN6mB9bBDKMQGaCjSjYphXAXW7iOL8llbxy8QWQYSFTjme6pKhTEzfZvM?=
 =?us-ascii?Q?/Xk4K6w/cKqoUzrOBWF4QbK0aT1W3FcQn/CRS8lgnFl7j07rSgJQIv8Xpz9/?=
 =?us-ascii?Q?CvDz80ka/Pyd4B7Utq2CBt/xgtb5rhDwkPcwG+VU0+XDiR2CYM5OZBo5ga8r?=
 =?us-ascii?Q?W7xbQTB/8HT1enPYuXfSZWu5mzRoIUmOSQiGhh58bQh4lwWzg65oNz9oAYYr?=
 =?us-ascii?Q?yH06Xe4TNDRpS0qEoUNcWS4nK1mi7oK1QqrKNRhoZ4CN25lOGq+FeP9G6Yo8?=
 =?us-ascii?Q?EbdY4+xbLgsVejq1eTNHT8oIDStNrnxM4OEJ12UzMkC3Bzs18bCBlsBIK/2S?=
 =?us-ascii?Q?pQqgTAN0rrCE66EOk54QbqKidZvvaRKLw9vWcTTlPDPiM6Jj/hLO1W3iQqjq?=
 =?us-ascii?Q?Al2DQGixXFqNZhNWnTKHSDUbMaRNTJdOPiYi2R/oS/DfkahWNl4REtgvi4jO?=
 =?us-ascii?Q?qPQPGhw6emPFWMdJriEynICzCdDzVsTiQ4dDJ2Zh5qvXFkxBilqv9XqEZeWi?=
 =?us-ascii?Q?sib2Koohwa3m3tsxYWa33EemYyEScdw8zeu9MmQMba/EOUixlwgV4cGTivSJ?=
 =?us-ascii?Q?uKmFAMGJq/K9bcbn0Kz9q1kTQZ7a2i4JMwgItKXYyQS48lj1Lg32tJfyEzLy?=
 =?us-ascii?Q?zp84pXoI7hGe6jksK8LRrO8COTA4F+xIQv6GwUlwyey4CpVvjD3ffyCaJoaJ?=
 =?us-ascii?Q?UeUOdkPLQv+yNVjvR+wl885PL0IYrJy9oJuhwVTyEU1ODg=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR18MB4477.namprd18.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376005)(366007)(7416005)(1800799015)(38070700009);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?G2uiHdnFI4uGjyTIs4Ma6x7T6TFByjhmRjG1fj1B9hIfo/iuerL1rcks3lPW?=
 =?us-ascii?Q?i5b4UXd7opHW/KfLjar0/RqisD0cyLviws64DrnXsBMeY75BFiBDxjc3qoa7?=
 =?us-ascii?Q?vatW4Tte7A88KcM29ocbY+QEv3c8GuyTRSK0kssDYfm7nywhYX2FnI7V1R4E?=
 =?us-ascii?Q?yPHvSAxuTbCvTCd2f0kFb2/xMlQkBg9qTsgbKPsxQKtA1p/LM6FdCTKRXBYi?=
 =?us-ascii?Q?F3HVxKHrCY3qn5ikvzfZG1MXCGJs3Ps8biTruB/OdBDGBGzndTEe/imZlgRU?=
 =?us-ascii?Q?snRq7npNxD1YRu0/2G3t6hWXGd4aM7eVMrcE57LXOYCXyvrlmFLFRkDpteBc?=
 =?us-ascii?Q?b7/dIwBxvxwsIAIhOBKI5CDIoc0vfGgpjtcfzE5pqLP3o15VfZ/qq2uKNkQA?=
 =?us-ascii?Q?k3Vwv1NxtpV6Er1MsnqtoBXRsEwvnSt1gJT+BozPQmH2lghSXL5naHjb7SDR?=
 =?us-ascii?Q?KCuiFL8+qPC1Ja1GIX6deG34hG9M7H5TaNOwUWW0AZv+dIF0/AI0qkUp599A?=
 =?us-ascii?Q?jOkztfuq7XO0QrnR+ngxXQfynSVYHAD1kU4uuLub5HAWtlY3ks2UKqiMRoT5?=
 =?us-ascii?Q?H2vgGFpdWe2mzKnreD49wRBunH9GjfoKDOm/f5tTklIwf/IgmLryIPFgkjz7?=
 =?us-ascii?Q?U1of1Z3D8+J5TFiMd/JIQ5/UX3g6eNitJfWDn/noceg2ZKrREa7jCk0hq8ow?=
 =?us-ascii?Q?A38hUXmbrJSGj2KPtoZi2y4DEXWIR0n8tQQEJilAhgio8Zd6zY+enMVD229I?=
 =?us-ascii?Q?0JcwkewYRKO2Onl/PXzwU/YX+/Bb4xORpkMgk4PxkZ9DBp3qdiQShCB3FukS?=
 =?us-ascii?Q?RNAeWkG3nSSplfGZiEIlMpsgamjp09A22vp1oenGLsCR26MfkUJ/deCBW6ax?=
 =?us-ascii?Q?D7H44xlQPU7vK4VNIjJXX+M4WM/z8wsJTTa9AlTrIu06fGQzOgPtFi4dGEdc?=
 =?us-ascii?Q?deztD1EQse3d4VjIxvAw0qIgoG6b1YddbcjxyoV/vBWaxc2XmN+tLHDguU6x?=
 =?us-ascii?Q?6agd6/uvFVO/Ba9FSyisRdGT0AfvpXR+EjrSE1uDi97bnVcFrx8nyEBc7W/F?=
 =?us-ascii?Q?r0OIshfGn8H0pvNSX7hYaQmtiW1WDyqCbnjyswviZ5KpQHUSCAlfNFj04Cya?=
 =?us-ascii?Q?12m31eyilG5iUFkhT74+r8lDxke/X6Efq3qYTR8DqZhN3yW3Mvc0k7mi3ofT?=
 =?us-ascii?Q?7EaofUY0Ox8MsrxGLgyT4jF7y33+PVeCKbBtfh4Hp8Cz6HGGOcji6+jVh9nM?=
 =?us-ascii?Q?83kR9ZQbCwadTU5ScbsgBo+YdQhOaIX1c9P81bO9YCIHSoVM3HJcMyYH9W1B?=
 =?us-ascii?Q?g4FTc8151Ox1F0FC4pTcIXXZyFCg6cReT7I7kwaOzMvyHQgA9pFMj2d6sTwC?=
 =?us-ascii?Q?7dA07jDVrbSXmVhg0JSRNfhX0sxjiY653ihkjFtFUrLCK3/OwsDoOjb118rT?=
 =?us-ascii?Q?Ssd6NYVuiHSA1nW8WCpWybB880TfwAkgzguGUx7d14c4wzvI8kUEsh52jdMj?=
 =?us-ascii?Q?w2rGsg6imYRdNBC87jeeqRdj+iV7YIOOxDPJF+jezQnkRRnM9zJv6QdVwWa4?=
 =?us-ascii?Q?ED8snPJPA5iPX08A/Uo=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: virtio-comment@lists.linux.dev
List-Id: <virtio-comment.lists.linux.dev>
List-Subscribe: <mailto:virtio-comment+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:virtio-comment+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-OriginatorOrg: marvell.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR18MB4477.namprd18.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c64e4dfe-fc1c-4822-8eac-08dc842adec4
X-MS-Exchange-CrossTenant-originalarrivaltime: 04 Jun 2024 00:11:24.0505
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 70e1fb47-1155-421d-87fc-2e58f638b6e0
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Cmk8VCXJogFlPetCLveEZoyEL84JVKwjbxXO1e/jqL1/ZvY39tOXpl7WwXtPni4oByVapEKOWuX5sbkR8ucdqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR18MB5309
X-Proofpoint-ORIG-GUID: BN_8k6HIApgWMskB5O9a5s3aEPnwo1w8
X-Proofpoint-GUID: lvWiHVQX2bm11vJ6p3-hXzLpYd7fKyLn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-03_17,2024-05-30_01,2024-05-17_01

Hi Parav
> -----Original Message-----
> From: Parav Pandit <parav@nvidia.com>
> Sent: Tuesday, May 21, 2024 5:30 AM
> To: virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com
> Cc: hengqi@linux.alibaba.com; Satananda Burla <sburla@marvell.com>;
> shahafs@nvidia.com; si-wei.liu@oracle.com; peter.hilber@opensynergy.com;
> jasowang@redhat.com; xuanzhuo@linux.alibaba.com; Parav Pandit
> <parav@nvidia.com>
> Subject: [EXTERNAL] [PATCH v10 10/13] virtio-net: Add flow filter group,
> classifier and rule resource objects
>=20
.
.
> +Note that at most one action is ever taken for a given packet. If a
> rule is
> +applied and an action is taken, the action of other rules is not taken.
> +
we might have multiple actions per rule in future. For ex RX VQ and TC mark=
 etc.

Regards
Satananda
