Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2063.outbound.protection.outlook.com [40.107.243.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67A4915624C
	for <virtio-comment@lists.linux.dev>; Wed, 12 Jun 2024 11:39:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718192387; cv=fail; b=WW6uHR90CF/Y+mxQ5WwMGEpYVuPJNtNbbqIDFbdyiO9kRXsMWQDcNWH/Bj5r/eRbLtEWg2rcCA+bNbMDPZVOCy0FzDoNo2ou04MfmznHdOFPgXHHeJIT+4Uts99SLmGxBNZH+FXnvtkPRvLPvA05L9Y7QRUWNitq7iY8oUYAKlw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718192387; c=relaxed/simple;
	bh=Xj82jw7wtdE4lF/pVcrFN0SdN7uTuBZc7Rri8vF3Zrk=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=k50W8GFPRbQWWI7E8cy94xABLSSonPdyFx4trWYkgsCdLJdDO9r5UCh52jTzOjzhv72UuYKTiKzPn8CWsGomN8JQFgSGWvN/o2FhPPRSh+eTBqke/BCEjZrRTl94miq1igbFryD/xorTZr678LjsIPAfLV7O6X7C9FFfmVyOTnQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rbnvP0Ax; arc=fail smtp.client-ip=40.107.243.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rbnvP0Ax"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HDb6b7CoCT56pvsRnyzhPmeSXC4GYK4qEdKprlXzDKV2ag2l+OHqNRwi/t0wtehz1FCt5FasPmNVVAVswI22THxkxm72cSppeuqnQTi6MESl0XlFkfSybm0Ihj/GfC8BqcR4e7p8dj0Gb8aTF4YkNcao1BcP359sZ2tdmlD5Or+ZYSZ5Q5LukJgv/8ZsiOfsoWZsdQKGTMxS5SQMd69bN5CZOlqqjiDEnUGIvWRTZSZ3Lrn6ZAeV0RL+HlmKeg68tYi7bqjKHqO+tfC5hH6+BIHydvboYlzL7/edV0rOc5lvtwvm0Xo8VRQvcjqq3zvf6aHR+o5/mEgibYZcQ8dyrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xj82jw7wtdE4lF/pVcrFN0SdN7uTuBZc7Rri8vF3Zrk=;
 b=hyo486jZ+8JY65tkkSxOP7VpVDmiKrLlpfWfpfp4YgKd1HaomyPpeNuB9d7JFnkD8ENK4w3MrMC+0RUmZSTsv06K3zoh2JGFqG+CkrFWy9K6/kr3Nr34ecc2kBgbBcojV/GX0efUDNFmPeNPLMSCiPFY5E4a4SIaTIGkuee5B4AqNHRMEOQR/vypjMwGgU7onyO58qrL/Jy9rHAFur0ismocJEFtU2uqLT5DcrEbJJGwTTmVcDjEGUEkMHfWKqQZzDkVvuJgmvHyUKd6MtMyBtvMci1kfr4aNBkfIpbQsLkOvUXIJBfthrdoOpec+W/Gg3t7chaevERTH95S6Wcbyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Xj82jw7wtdE4lF/pVcrFN0SdN7uTuBZc7Rri8vF3Zrk=;
 b=rbnvP0AxDdSLykAgAjFTC9htv+t1e/lCxeStaXmDZp6iDL3w0R/j0u4OMkymWr/QBP7Kg2633D337a1lc+Zq0IPUukdW+9Es4WzBx9fGQ1lkEI2Jzkg1ERl4iSj4CChSvV4CYrDHNX800ahPpPOWvBUQz/+uc0WoQ4Nyea244oCsBuSKfi8F/Xts6UBQsgrHnhnl/IpNBjiJLjOJeX31PfFmn7fDcTWE+sdNjWlTknmy1r/jhhA6PHpg0JFITBFXuGBkZgUTOAGI0Uacp9qTxckTsF7zrscvhWkwBoFvJ2fmRmJ2FjPw7YzB1SMG5SAr/9i0ydsFIx8PnEmVBvjuLw==
Received: from DM8PR12MB5480.namprd12.prod.outlook.com (2603:10b6:8:24::17) by
 CY5PR12MB6178.namprd12.prod.outlook.com (2603:10b6:930:25::19) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.36; Wed, 12 Jun 2024 11:39:43 +0000
Received: from DM8PR12MB5480.namprd12.prod.outlook.com
 ([fe80::d03:f00e:1bbb:1921]) by DM8PR12MB5480.namprd12.prod.outlook.com
 ([fe80::d03:f00e:1bbb:1921%7]) with mapi id 15.20.7677.019; Wed, 12 Jun 2024
 11:39:43 +0000
From: Parav Pandit <parav@nvidia.com>
To: "virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	Cornelia Huck <cohuck@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: RE: [Request to merge: editorial] Fix admin to administration
Thread-Topic: [Request to merge: editorial] Fix admin to administration
Thread-Index: AdqyiAJ1cc1W9ZiIQhe2TjSylvZwoAKNQ0gw
Date: Wed, 12 Jun 2024 11:39:43 +0000
Message-ID:
 <DM8PR12MB5480B63360C1C057C8FEB539DCC02@DM8PR12MB5480.namprd12.prod.outlook.com>
References:
 <PH0PR12MB54810E16E35AEB44AD31C341DCF32@PH0PR12MB5481.namprd12.prod.outlook.com>
In-Reply-To:
 <PH0PR12MB54810E16E35AEB44AD31C341DCF32@PH0PR12MB5481.namprd12.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR12MB5480:EE_|CY5PR12MB6178:EE_
x-ms-office365-filtering-correlation-id: e0b102bd-87d3-4433-66e7-08dc8ad45a41
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230032|1800799016|366008|376006|38070700010;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?tDc8OFNUtnIBCZUJiuGglGC/oXQbD7rqq21/P5Ge6W0EFRQCAvUMnASQKocX?=
 =?us-ascii?Q?skioELWZkDCoQYem5UyZ6mzhv/S4Y7kVbunEktbOZ0FdDSSRXrNbGo23h0Sm?=
 =?us-ascii?Q?4Fscq8HcufTrMk7eT3sffmEenZNItPHBTFNOSEaVNlvRurTRk7s9GgLb9S4o?=
 =?us-ascii?Q?4wsaEKgNNN1XRXuf8T9TJdVqJJ9p+AlNyzUGCkg2igrOWhYAqcQNgHPmEfjS?=
 =?us-ascii?Q?3/2RGC8OsclYo9Ay83nUfucIVOY0YkZK3vybFLQu9pbfs/ikn116pL/6z9aU?=
 =?us-ascii?Q?0G6/HveSMJyBtHN/qIXTjCWf+4pa0TtHt+U03mPoXtD+z+Xi/YWRl+bua7Rn?=
 =?us-ascii?Q?N8sGO4bCsqpiDZBhuNa5sXQAY7wGagCcBTV4oLqD+vWGQQ22GAN4AHg/sldB?=
 =?us-ascii?Q?otLAV4hRuCGcgdsE0tl5iMZ+TrGlqFgdbJeSxfEIoHNtuK+sJyctXCqzCs1N?=
 =?us-ascii?Q?EKDXzAVYNgVyQf55w+0rm+qKx2hiGhg6PFgvo/J5P2UdrTSLGV06gKxwkpkM?=
 =?us-ascii?Q?Vn1s/Iv6Ys+mD5wTIfJuCQydO5qG/h5SRnxw3uEou/UY14rjO11IYONcWflI?=
 =?us-ascii?Q?EMYEYfzxQm2O7PMgvFbYbEdZ0/2n0Q3+KZrFRqDSh9i1uoN1srAnrryKMdOe?=
 =?us-ascii?Q?x9WVrpfknbdEFkJXIbKTsLDbzbSDzBq8B55igHUMKFgNcoezQ45UQxJkTnAl?=
 =?us-ascii?Q?dmMy7/L8lE5vdU4pPjQ+s13j/4eyIuVP0bIi5LoTqYradfr3J7XV7g9S+//X?=
 =?us-ascii?Q?F4BkdEw8YE5AIDSvXGAklWCPClSvw5UMr93a7rDRxZuySB6rxLnGf2rVem2A?=
 =?us-ascii?Q?IgBoglXT7vgi21ZZ0hyPk60EJ1BgapkUCVCjBPjlsBGyKvujzj3MafVO6SeO?=
 =?us-ascii?Q?M1OT3rQPXa2bQmMS0V/82CgSCDZa2nI9itwtz6dCP9diRVWffiPN8MTKVRqn?=
 =?us-ascii?Q?2z6Mak5RuySGJWyQsQ2pbg3KAZbFPaulhaWN+L1wNXdwTNTTFmBwOy8poaVS?=
 =?us-ascii?Q?S3S31DI2KbXJyOkIQY7k3esbOKoO0fQjgGHm5l/BjRlDeE5q+7wHpvIHwHjx?=
 =?us-ascii?Q?Q8VOxkgNzwuJxDkBEGnFfLxpjjTEAtYJIDq6T6fQYRWFBR8RxRGJwrBPC1ni?=
 =?us-ascii?Q?cQVQ7AV3f7rGGCzC+C4mGuha9juhs2m35jC7B43UYXfNZUKK9ph2ocj4asOs?=
 =?us-ascii?Q?Kf5NMgSEDYUKCRYypHVqW7t7Uz/wVdD4Ar43H8XrWWhJEgb0zzBWmr2vBwNF?=
 =?us-ascii?Q?kdX9+qUiCg3UaMW3gAoNSSlS/QKYNDdiGCUnZOwL7ztWXfIe4fINdum0faVV?=
 =?us-ascii?Q?veL8uAZShSVb2B7OKwe4cuq4Odr/+wNLKWz7KUSxUp+4TH7rsIKr0eXVhL8C?=
 =?us-ascii?Q?xJ+WQzU=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM8PR12MB5480.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230032)(1800799016)(366008)(376006)(38070700010);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?jCuCqpi8NachjUnUjxDkXCo2c2Xmg1VpHS34pQvYzUoHhM52q6ctqFm8WF5O?=
 =?us-ascii?Q?qlgJ39uRlIZBqvMXnxr4XozNI1Yve1Pd6jcDiTI4dp4AEjfCj8VqRpFZCRKH?=
 =?us-ascii?Q?lTj+JmfZa3SnZm9i57cE3kDRXsNO6gcZMXcwLRxqOlke746w8ODLI3OPeaQv?=
 =?us-ascii?Q?mGVpksHSBiauFvlQRzBcK8N+ycfEcW9M9VFsXnQWtFAg98JJfXwTZxQgDMM/?=
 =?us-ascii?Q?FEjqnTr9LfsabS/RQReDsvUH1jy9MSComnduA7fXOEPkAYEoyDl8Om9q6e6L?=
 =?us-ascii?Q?fTF8uQrs/fHTtVtu1IVe9IN49lkK4RNKRr6Wuri8kwPVCinxe+KZykvLPR8V?=
 =?us-ascii?Q?nSryLYOjDuXw7WlQXQaZDbvBZ1RSwzyGCrLj/mvRimD0DPwrfJa+vYAbdaIc?=
 =?us-ascii?Q?qnmdyMIVZsLy+L+Zd8fmu+KUKSe2RetYt7Q2eFOeby8RoeFje422jXUSOz44?=
 =?us-ascii?Q?NuzahcqUKVIQFtdD7FyaTGmL0CIgTKrYC9W2h+m8kez94tEED0gDVsZVUtst?=
 =?us-ascii?Q?dAIkY/CPbR6c0QFNunF1G0eTzFwiAimBG9LTqRSo902SF46Fw5y5AyULtoEx?=
 =?us-ascii?Q?/8Pkp/RuC0L3/R2OGs4SOq/ew7jUTnETK1/WXYY3Dy3VQXq+wGFjI2Fuwjks?=
 =?us-ascii?Q?z5g1EEJ+o9pIZ9vxkStbTnSWga7FcFPt9dq0SqEjRCL/eIcQKAn+LZnfgpb6?=
 =?us-ascii?Q?LFWeZSSI1ZCD3P3Y1kTz4AykcMdJvlHWGgPeTKMl1m4qhF1hmjKl3pD6udF9?=
 =?us-ascii?Q?96+CjGKQr1TPEIZyJToIeWSO4wmKfoxS901C5tmUlLwMK6vqBjb/eZ5EZNse?=
 =?us-ascii?Q?zH3pLD4gna7lEdDtrssSk00jRJOrmdHYvWX5vw7ZRczFOIeqYUHhCem/foZV?=
 =?us-ascii?Q?fPwSvxQuIWriuLL8YVFHq79xGgKeqVSAIvVaDO04RUNwV7FAI/7wHbcqK9fJ?=
 =?us-ascii?Q?PjmvbG8opXyyETTJADjymEZoh20Wapzewpyq6Ympz7F/68H+SxwFk3pSW1Q2?=
 =?us-ascii?Q?Dl3oxmUunZSMYZas3h+kAY8tBphaI/uIS5BfQb8grs7d/f9Zm+OhROx2CO8a?=
 =?us-ascii?Q?K+Mwl8NIdvdjpDyL0DpDtj81IgXhQ8r8zCrEAE5JgWt6V/XwAow5xmWRc+qQ?=
 =?us-ascii?Q?K5+kfKoxlDpVHLWBToRqeVHJZ1Jun36+j7qDBpdm+xIi4Xi586Y+p3E6pM2l?=
 =?us-ascii?Q?dMPKCIn9Ga6pEdDQmG5XeoZMBFpJhMSAf8ZhIdcy30lbH6/vGjDkQ/4u7SIq?=
 =?us-ascii?Q?aWkSbvBvpHDPDg/vqIMHdB/00eWEGTzdgjJBP8NmGekEa9iBDWghGLoA2Kv5?=
 =?us-ascii?Q?bYl++zy/vw9iYzFJ3fBNNcnv9YDYW2WbPCCJbTUgC6G+PYfWZrFU7quNZSl2?=
 =?us-ascii?Q?HA6cEAOgIR9JOhafAZQlkkOZTwulnBFfUvgxkDhcX4H2SBY0qCsR3Tmg1Oxi?=
 =?us-ascii?Q?z0o7mVl11v0OViDYZyzroLbI/tfiXxcp2XCUU+Gu8H+sevYD0z/LMdaAkHEo?=
 =?us-ascii?Q?TWEWHxs/c+UreWzwEmUcwHEsphmbTV3YKpDsuSMevMxhAFzScUFVkterodyr?=
 =?us-ascii?Q?kq8N8ZDYj3lrznqeBYY=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: DM8PR12MB5480.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0b102bd-87d3-4433-66e7-08dc8ad45a41
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Jun 2024 11:39:43.1082
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: ypnO6rXvwKnmaFQy9fC9OkFdB/oZp88AuBs/d+fn/3GkFMO0vhKzwOQfatsv1URCe/qpFb/74oyEkIZpNsPhdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6178

Hi Michael,

> From: Parav Pandit
> Sent: Thursday, May 30, 2024 5:25 PM
>=20
> Hi,
>=20
> Can you please merge editor change of [1]?
>=20
> [1] https://lore.kernel.org/virtio-
> comment/rkvznbkvylpld4basur3qxjsmsncawpt2hpwohrrg77yxwp4zc@i3l6t3
> htp4oj/T/#t
>=20
> It is posted on 21st May 2024.
>=20
> It is:
> Suggested-by: Michael S. Tsirkin <mst@redhat.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Can you please review/merge this change?
