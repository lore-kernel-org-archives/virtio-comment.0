Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4729EEA8
	for <virtio-comment@lists.linux.dev>; Fri,  3 Oct 2025 12:47:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759495643; cv=fail; b=esl/PQdcUbsIImlpSL+engvA0EQEfCC0kgP730cWmIUVEhQiE1rEpsQsZlk3TBSvXcvBge45KnSqzu+o03G7SX0K2m1qblgF+titufMYkxKG+0IdzeRfkUGBI4zY7NgP2b1s5Wbrfcoduo27RNAQr2fB4xCJVh0RDub9w8ebtq4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759495643; c=relaxed/simple;
	bh=MH482cVplvKA5taNzq+HbvN3MK1XZfjuGs1kS+9Jz5o=;
	h=From:To:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ZU9k46glibpFihTvA7k36DNSYGSSwqfB72JS7ZB1lzhQg8DqC6gah1YXHI4f/3Y1LFD/aTS9a2cfuwZ9e43k+hCrqUu/nDoHPOoOBS4XjiJi/S/yms/q+Dt47gTXyWTFOx+1dltZyM0xuVxQunp+DA/E29dGDhdSHqlwa6rGQr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UjxZ5jfX; arc=fail smtp.client-ip=52.101.56.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UjxZ5jfX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hFIVM0qKOIGYGGgV2X3LHjoQsCbZrEwJ5s6/AuZ2xhwRqkPvqO3CmLlhb73uJVRu4htTO9gQXerL/zKG8sqsXekOvIEWXeDLdvb56XLiFq8RXrPJh91ZtBC1CMBBqC8ovXE7M8f4Th8dKOnee0748llMWPBgwqM8Bs5GnYudv6CkykEnaH9xfMaWZJj3p5y1SCtlLd026BV22fe4j4UYEV8Qh6oaeil3aCwQ5n/0cTwnBv+ZcpAAmgraZSG2olsOSiKK8VdOBe7+i4FvmgIzmzQ4cb9r5+XtGE1grbnh9z6vrKYBgxRP6DZ/1JCgYYhhrLKHZGSSae3/17rry8msgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jYLJLsKnXiuwUREwUvxSjNA9NFuhzxvOkNO4tcE1Jdc=;
 b=NxZNM1hLAk/E3Su1DQobGD457zHGjdfeA2hsniDOxk5ldntT0Xm67/ofH3Gpwt81p5SG53GMgKmRu80fHM/0A2dIq40+OUxsBpK6gjF7/L7PSMZFRpAW1CNuywx6OT55Xc43wbhR45BsXJPg6VO42OqsM3ePd716J74e3OikelHKGtDsGB10dI7O5D5eXskQjOLtuyczpciWZ39eEztTwVeG5UJzVFFbRZVQ33KySnlZgRoUZp6wfAz8Lanbncioio2/MKDkRINbIay+exeRS5QRCRewIKtkKOPNI4loZ/YY6DNtBORCkNm4BFo4PgyxzwZ5DaJvXJfEMEZ4vj5XVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jYLJLsKnXiuwUREwUvxSjNA9NFuhzxvOkNO4tcE1Jdc=;
 b=UjxZ5jfXYIaf9XE+wzBj7lRZLqukjx6Yh6+fAyp5nqeKrqG26dQnkuS/78gXs5+t0IhkUxUNQrOr7fk/g7Sedx0VYw37zuNLFGVwngeNSIt4pEZjZTTGPJ9G/O7rGVJtuW5GdAEnEyPXrr+2V4f/vWb8kfB5+7Q2IUxgJlmDaKzwt7xdlYUx32axQ4nChuhlvCHJkWwHibbY6kAHyNLaIKI5spUwstbe/MSUty8Tsm4L3PoNkY2gnUZkLEWSiilxvsTZmdwPezH9rCBWLjJvZnTf3f/YAC7cet2peUqGFTgjjIE7WQrohys7MD73bBe9T+/0q9HBKMRf5LbJcCW64A==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by DM4PR12MB6471.namprd12.prod.outlook.com (2603:10b6:8:ba::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 12:47:08 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::e571:5f76:2b46:e0f8%5]) with mapi id 15.20.9160.015; Fri, 3 Oct 2025
 12:47:08 +0000
From: Parav Pandit <parav@nvidia.com>
To: "Chia-Yu Chang (Nokia)" <chia-yu.chang@nokia-bell-labs.com>,
	"virtio-comment@lists.linux.dev" <virtio-comment@lists.linux.dev>,
	"mst@redhat.com" <mst@redhat.com>, "cohuck@redhat.com" <cohuck@redhat.com>,
	"mvaralar@redhat.com" <mvaralar@redhat.com>, "jasowang@redhat.com"
	<jasowang@redhat.com>, "xuanzhuo@linux.alibaba.com"
	<xuanzhuo@linux.alibaba.com>, "eperezma@redhat.com" <eperezma@redhat.com>,
	"ij@kernel.org" <ij@kernel.org>, "ncardwell@google.com"
	<ncardwell@google.com>, "Koen De Schepper (Nokia)"
	<koen.de_schepper@nokia-bell-labs.com>, "g.white@cablelabs.com"
	<g.white@cablelabs.com>, "vidhi_goel@apple.com" <vidhi_goel@apple.com>,
	"ingemar.s.johansson@ericsson.com" <ingemar.s.johansson@ericsson.com>,
	"mirja.kuehlewind@ericsson.com" <mirja.kuehlewind@ericsson.com>
Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Topic: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
Thread-Index:
 AQHcDRMxc7D2+BxJGUa3jiZ0uZVtV7SqECZQgACnIACAALBIAIAAa1mAgAEnxVCAADbEAIAANhWAgAAbXICAAwZbwIAAFfmAgAAMFGA=
Date: Fri, 3 Oct 2025 12:47:08 +0000
Message-ID:
 <CY8PR12MB719590ED886A60EE7867E7E6DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20250814120118.81787-1-chia-yu.chang@nokia-bell-labs.com>
 <20250814120118.81787-2-chia-yu.chang@nokia-bell-labs.com>
 <CY8PR12MB7195670B68CC8F454DA821C6DC1BA@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79843798615E61FA134A5428A31BA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <5f1f310d-8a17-414b-ac70-80028832a78b@nvidia.com>
 <PAXPR07MB7984310A505E7EDDCA0CBFA6A31AA@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719523226B3E785B8433C823DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79847467B33487A8F0CA5ED5A3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB719518C4A8F3EE03690E44B1DCE6A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79845B9580C4D17590E8C2DEA3E6A@PAXPR07MB7984.eurprd07.prod.outlook.com>
 <CY8PR12MB71959308B23EFE2A920D8B20DCE4A@CY8PR12MB7195.namprd12.prod.outlook.com>
 <PAXPR07MB79841A2F8A719FDAD35AB0D0A3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
In-Reply-To:
 <PAXPR07MB79841A2F8A719FDAD35AB0D0A3E4A@PAXPR07MB7984.eurprd07.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|DM4PR12MB6471:EE_
x-ms-office365-filtering-correlation-id: 56e7e490-7acb-4044-1110-08de027af6e7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|1800799024|366016|7416014|376014|13003099007|921020|38070700021;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?4c9VEeMzv2xZpsNsGWnXcYACYkc0P0OjPZ90JSMp20zrAH93k1eEW+6BYk4O?=
 =?us-ascii?Q?reR8Oo8iv5kpJUEGvJmSFZN+NDM7k2uGzt6a5IWRfTQbW4JyWieVWPkJxod2?=
 =?us-ascii?Q?UTDiIsYnQ7+UOaGl/vtT0AgN7Oa2HC/vgXTdKp29bGcx4zRTaL7oNsOS61Oe?=
 =?us-ascii?Q?Ewk227eHKOnS+5LWTBOu/wm/U4tMCigRdVWa8NBc1SqQEd/tRBrks+kH7Ivh?=
 =?us-ascii?Q?/ZfM9zxZU9P4yR3Ih7Q3nuyCWUgr1AwtX3Yy2diINmIar1RrCbC7zinLQMS4?=
 =?us-ascii?Q?+Pgdzl41z1d+f8xzSkSjsqkh5+qgrg1wbp5AcdgTVxPvgFTPkTa2zF16mtTA?=
 =?us-ascii?Q?wp3/di+vMDfw97NpDCsV4JhDDE/n7JORZ3Aw17OVJReoioX0VWWpA7Lmx4pG?=
 =?us-ascii?Q?U9O5LEd7k2GLyKfI3LUOO4Q0z/p5CVQjGyYwMIxgNBazm/aqHt4kl6pX1oGS?=
 =?us-ascii?Q?m4SuswzE2UklZjQSF8QY6Bun5eHLJ/C814+UhxguLG9HXf+CHkCRUGKBVkDO?=
 =?us-ascii?Q?Lj9u6NuAnZ9mWDYUEd8yK7ZGA0/BNQrLjIRvVYcsbfBXgRW+T6JFZNuliy7k?=
 =?us-ascii?Q?IqkH0lonPp7yUh6u4bmj1Qch9aEPXwfm7iHUiDbA4Nmhm0P+3Dv+TldzJhny?=
 =?us-ascii?Q?YI/RkPZ0XSKTC00dIYcy8UCQIkVQP1dtAgW6ZcctVcqf9yHG4jhaTW9GvOmD?=
 =?us-ascii?Q?gCmNMdPFsFqeuw6ALZqlkjEc89boCFkVBKZda4bqnO6qMhZqsVYnyXg6ge22?=
 =?us-ascii?Q?PdbI2zqCmyY43g+NPiWHLYOqsHz6oRS+jC5PN3cGF5aK+DZ3aUIYgZzn2jYm?=
 =?us-ascii?Q?xfYFzjx2r54nTOQBEtekZ+vSltVZkZqwjEEKEOh0kuMcYN7BkIsPnG2IuK0a?=
 =?us-ascii?Q?2JmdB9joPlsGYjxKQZpK/BZEgbaXAMQIbI0aDMxNDcNynUmzkmekiiOF6QP9?=
 =?us-ascii?Q?RFzFTbYPDXlXovoy7l8fJWXsaJ1/YUnRWXnxVWSzN/HUUf24c6SAZswCNQDR?=
 =?us-ascii?Q?UdjY4Io47zZeNe9SVLEBEWs1/B9PDI16FaJC4ge4ifMihr9cTeK/Rs5TlKsp?=
 =?us-ascii?Q?d3qWg6H7xKFA/m1VRUwcm1SVT+6THrUy342mH88exZyrwK7V3Ak63MY6UuPS?=
 =?us-ascii?Q?0oACMsrBkPuCe06wm0+WtUFTA1aVX0G3IRQzDAvsLDaAHpYaWCHeSR0nQrXo?=
 =?us-ascii?Q?+k9KAMLuuo5E55/svGQkdjEKt1dPYIBxskSzL10M+aOOBxJoE1ohXYhHYWbK?=
 =?us-ascii?Q?qCRlHxwCC9lGXubNuZlat/SX4qgnm0lC682yn+FHnhY6RHbkPPUy6fMSYRtD?=
 =?us-ascii?Q?ab8FwOrjjraCbtGkbXF5vmWD+ivrywZbaym4aJbPaqZxg23X9F4zGVvlvuvs?=
 =?us-ascii?Q?N5z7BPmCJaYMy8RVnQJF3Pv2+ll4fyJzpk+XW2FEvQxEQXGm0Ihw1hRiR06C?=
 =?us-ascii?Q?BsfXlYPdUJE54KuVIVI+vEhJcMQ9axxVRjEotOyvl7bnaUkVC/cgBb1XKNKk?=
 =?us-ascii?Q?Yu9Zj4VAkUItonysLnc6OWM6nKpf+1Zlmxk7/hcGi+L4Kl8P/l54voMFvQ?=
 =?us-ascii?Q?=3D=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(13003099007)(921020)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?6+3Sqdfvak9HGGrc545p2rjo1b7dK0j8zNbholEEU0FPA//SdN4AZ9sbz+XY?=
 =?us-ascii?Q?s2LsJAtqZMarbN7+JVvlHMmwv8FikXCu03efNB40AX0uYh1G0zAm2ERYo5dJ?=
 =?us-ascii?Q?3AMlkhWX4PsqWkP5s4i4aU/mSOpyAxT94Q/GjS0U3C5DJWknANS9S8Y1MIRp?=
 =?us-ascii?Q?S3XRg3VHvukPzLmA2AIYvnTGLPPJ/Mt4cxAoNdUCFFtzaw/vgVpLAJu+i5wH?=
 =?us-ascii?Q?u2lzVbW6PUdwhgpArmTzJ7y4M/M6PutDj0LfD5QHq+2junBSNnWkY00Qaoaa?=
 =?us-ascii?Q?+KOqZQZ6ec6cq4ojq37JjZ/aDPe2WNz8s8qme0tPbINaKUAaAzkbuUPHxmrx?=
 =?us-ascii?Q?IYU4Jkxr3dxwQ7qzojY4pSiPg+/YgdV4zz0o+oFSPpfJ0TXbu1C4YUofBuXf?=
 =?us-ascii?Q?X/goMyfDkCYOr3Xi99B5QatIAN0Qv5qco4m9LBf6hlKDamT8Bt5rOqzLiplS?=
 =?us-ascii?Q?diOhhhkCkiiWQ+uzEoBbvX1nfEX28yMZO7XjaL4AK/9KflZV4oLJOXUnWbrO?=
 =?us-ascii?Q?lebg9ahoibDJjJt+Z3c4FdOX7oDr02GnjldeXYN5BjwtmoxuJN2hPyNe2YQf?=
 =?us-ascii?Q?NdPMJhDM/+dSGulLICT3/nn3bpAUfsYwvTC/jHm8I1ONPS9Nk8EkE88RLIi/?=
 =?us-ascii?Q?LBsgIxMx4vquOkVRDRcim+pgD/K2Cp+ZC/Q8HP1YIOEXVCWqQHQRyZiEfDHv?=
 =?us-ascii?Q?Lo4tZRYwQ3mQtPTnGYcT2yCTSVYAUafRfWtVBoHmzih28qiDSxT5i6EngEvo?=
 =?us-ascii?Q?TMugHN+67v+fbWVyZJJ4e7AgY0MEfv/Aj6wpBEZBonXWM9oCGfnIjbjE7mNX?=
 =?us-ascii?Q?KEq4yvzYcoFfoZBRpjJ3p2It0vyQeqg+wA4FQwEFDkcwCu7lNhQ2exsUfC9u?=
 =?us-ascii?Q?RTFeLBWrY1krVWcCCv3K9wTdjzs4qZgSdg9vKRVAcD0tA9Ov5fJtCVYD5RQ9?=
 =?us-ascii?Q?Fy+rjn0Q7++tRx7nRws188k+V8Ot34tw4hdMUFmBoaf6U/MhlUHQi1HxIISa?=
 =?us-ascii?Q?aAWklOH7XoKojhwIxYHrZiXPXk2BE+jWJf08iqPzFIgME4Eqvj22zxAaRlAd?=
 =?us-ascii?Q?s7wbS5iYr9+YP1F/q4fLFxOlqgbumYXeJ62iGHVx6oJVLZYH8DWY05wOOglj?=
 =?us-ascii?Q?Bl1jmOeP6I3XVQHVZWvdujp8jS6elyhp6g9t8Kp9YAsAdfQ3PKhHPKG4u6Se?=
 =?us-ascii?Q?Qg2mIDpuO6H/ogggEPcErsTkwNY39ZA6cxEnnDIOvaOGDGlHuzFaJVi6Y6jR?=
 =?us-ascii?Q?REGj6OFAYxVxUj+KwnnP6QAubJo6XO+Hz4kRrKr8vYBJ9w4/LTKozfnGSE4U?=
 =?us-ascii?Q?HCXxavzc+GHIOWANAr9g+rP16X4tjcva4iji9rNcokcd4vnvH9trg8GkREN8?=
 =?us-ascii?Q?8xRDjcFDJBynRkMmeG8iw/xPFY2HC1ORvd+30DQYJvcQfMuE+q2GHBHVB6tl?=
 =?us-ascii?Q?ro0jOEFZXFO1AKtZYkr987bOyFHHi3IGn81/SRXethT9U5DBt420XLOTodWv?=
 =?us-ascii?Q?8lAbvLnOBX6XEOfnO3Kk4QfUz0r34MFYMHMWEO4vtxq+r/yrAbwbrjX1ZAYS?=
 =?us-ascii?Q?K/5MIXTk9GayVLpuPoQ=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 56e7e490-7acb-4044-1110-08de027af6e7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Oct 2025 12:47:08.4157
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: bhRsga7XQ8Z266KFyj5B9J4GyPloUDtMCcYAXghDjpf5YUCMM580Hqwr90uVbME+SpKn6BN4oru/YMgFXiVgMQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6471



> From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> Sent: 03 October 2025 05:26 PM
>=20
> > -----Original Message-----
> > From: Parav Pandit <parav@nvidia.com>
> > Sent: Friday, October 3, 2025 12:41 PM
> > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > mvaralar@redhat.com; jasowang@redhat.com;
> xuanzhuo@linux.alibaba.com;
> > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > g.white@cablelabs.com; vidhi_goel@apple.com;
> > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature descriptions
> >
> >
> > CAUTION: This is an external email. Please be very careful when clickin=
g
> links or opening attachments. See the URL nok.it/ext for additional
> information.
> >
> >
> >
> > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > Sent: 01 October 2025 05:56 PM
> > >
> > > > -----Original Message-----
> > > > From: Parav Pandit <parav@nvidia.com>
> > > > Sent: Wednesday, October 1, 2025 12:51 PM
> > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > virtio-comment@lists.linux.dev; mst@redhat.com; cohuck@redhat.com;
> > > > mvaralar@redhat.com; jasowang@redhat.com;
> > > xuanzhuo@linux.alibaba.com;
> > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com; Koen De
> > > > Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > ingemar.s.johansson@ericsson.com; mirja.kuehlewind@ericsson.com
> > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > descriptions
> > > >
> > > >
> > > > CAUTION: This is an external email. Please be very careful when
> > > > clicking links
> > > or opening attachments. See the URL nok.it/ext for additional informa=
tion.
> > > >
> > > >
> > > >
> > > > > From: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>
> > > > > Sent: 01 October 2025 01:04 PM
> > > > >
> > > > > > -----Original Message-----
> > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > Sent: Wednesday, October 1, 2025 6:24 AM
> > > > > > To: Chia-Yu Chang (Nokia) <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> jasowang@redhat.com;
> > > > > xuanzhuo@linux.alibaba.com;
> > > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com;
> Koen
> > > > > > De Schepper (Nokia) <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > ingemar.s.johansson@ericsson.com;
> > > > > > mirja.kuehlewind@ericsson.com
> > > > > > Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > > > descriptions
> > > > > >
> > > > > >
> > > > > > CAUTION: This is an external email. Please be very careful
> > > > > > when clicking
> > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > additional information.
> > > > > >
> > > > > >
> > > > > >
> > > > > > > From: Chia-Yu Chang (Nokia)
> > > > > > > <chia-yu.chang@nokia-bell-labs.com>
> > > > > > >
> > > > > > > > -----Original Message-----
> > > > > > > > From: Parav Pandit <parav@nvidia.com>
> > > > > > > > Sent: Tuesday, September 30, 2025 6:15 AM
> > > > > > > > To: Chia-Yu Chang (Nokia)
> > > > > > > > <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > > virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > > > cohuck@redhat.com; mvaralar@redhat.com;
> > > jasowang@redhat.com;
> > > > > > > xuanzhuo@linux.alibaba.com;
> > > > > > > > eperezma@redhat.com; ij@kernel.org; ncardwell@google.com;
> > > > > > > > Koen De Schepper (Nokia)
> > > > > > > > <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > > g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > > > ingemar.s.johansson@ericsson.com;
> > > > > > > > mirja.kuehlewind@ericsson.com
> > > > > > > > Subject: Re: [PATCH v10 1/2] virtio-net: Fix ECN feature
> > > > > > > > descriptions
> > > > > > > >
> > > > > > > >
> > > > > > > > CAUTION: This is an external email. Please be very careful
> > > > > > > > when clicking
> > > > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > > > additional information.
> > > > > > > >
> > > > > > > >
> > > > > > > >
> > > > > > > > On 29-09-2025 11:14 pm, Chia-Yu Chang (Nokia) wrote:
> > > > > > > > >> -----Original Message-----
> > > > > > > > >> From: Parav Pandit <parav@nvidia.com>
> > > > > > > > >> Sent: Monday, September 29, 2025 9:48 AM
> > > > > > > > >> To: Chia-Yu Chang (Nokia)
> > > > > > > > >> <chia-yu.chang@nokia-bell-labs.com>;
> > > > > > > > >> virtio-comment@lists.linux.dev; mst@redhat.com;
> > > > > > > > >> cohuck@redhat.com; mvaralar@redhat.com;
> > > > > > > > >> jasowang@redhat.com; xuanzhuo@linux.alibaba.com;
> > > > > > > > >> eperezma@redhat.com;
> > > > > ij@kernel.org;
> > > > > > > > >> ncardwell@google.com; Koen De Schepper (Nokia)
> > > > > > > > >> <koen.de_schepper@nokia-bell-labs.com>;
> > > > > > > > >> g.white@cablelabs.com; vidhi_goel@apple.com;
> > > > > > > > >> ingemar.s.johansson@ericsson.com;
> > > > > mirja.kuehlewind@ericsson.com
> > > > > > > > >> Subject: RE: [PATCH v10 1/2] virtio-net: Fix ECN
> > > > > > > > >> feature descriptions
> > > > > > > > >>
> > > > > > > > >>
> > > > > > > > >> CAUTION: This is an external email. Please be very
> > > > > > > > >> careful when clicking
> > > > > > > links or opening attachments. See the URL nok.it/ext for
> > > > > > > additional information.
> > > > > > > > >>
> > > > > > > > >>
> > > > > > > > >>
> > > [...]
> > > > Virtio spec requirements are clearly written.
> > > > So just by referring to RFC 3168 is as blurry as today in context o=
f GSO.
> > > >
> > > > At best possibly it can be written as "device SHOULD do ECN and
> > > > CWR in first
> > > pkt.. and subsequent packets SHOULD have cleared".
> > > >
> > > > If that is not aligning, than better to not make it more blurry.
> > > > ACCECN feature bit can be more crisply defined in that case.
> > >
> > > OK, then could you let us know if we make below changes in the next
> > > version, are they clear enough for virtio spec?
> > >
> > >
> > > 1. VIRTIO_NET_F_GUEST_ECN (9): Driver can receive TSO with the CWR
> > > flag set. This CWR flag is only applied to the first packet, and the
> > > CWR flag of subsequent packets should be cleared.
> > >
> > > 2. VIRTIO_NET_F_HOST_ECN (13): Device can receive TSO with the CWR
> > > flag set. This CWR flag is only applied to the first packet, and the
> > > CWR flag of subsequent packets should be cleared.
> > >
> > > 3. If the driver negotiated the VIRTIO_NET_F_HOST_ECN feature, the
> > > VIRTIO_NET_HDR_GSO_ECN bit in gso_type indicates that the CWR flag
> > > of the TCP packet applied only to the first packet and is cleared in
> > > subsequent packets.
> > >
> > > 4. The driver SHOULD NOT send to the device TCP packets requiring
> > > segmentation offload with the CWR flag set ONLY for to the first
> > > packet and cleared in subsequent packets, unless the
> > > VIRTIO_NET_F_HOST_ECN feature is negotiated, in which case the
> > > driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
> > >
> > > 5. The device SHOULD NOT send to the driver TCP packets requiring
> > > segmentation offload with the CWR flag set ONLY for to the first
> > > packet and cleared in subsequent packets, unless the
> > > VIRTIO_NET_F_GUEST_ECN feature is negotiated, in which case the
> > > driver MUST set the VIRTIO_NET_HDR_GSO_ECN bit in gso_type.
> > >
> >
> > Also, while it is good to document existing behaviour of the spec, devi=
ces
> and drivers, I believe that ACCECN need not have to wait for the
> documentation of existing GSO_ECN.
> >
> > However, I am bit puzzled with the Linux kernel commit [1] of yours tha=
t
> hints that ACCECN may not need any special handling.
> >
> > You described,
> >
> >     If NIC is completely unaware of RFC3168 ECN (doesn't support
> >     NETIF_F_TSO_ECN) or its TSO engine can be set to not touch CWR flag
> >     despite supporting also NETIF_F_TSO_ECN, TSO could be safely used
> >     with AccECN on such NIC. This should be evaluated per NIC basis
> >     (not done in this patch series for any NICs).
> >
> > Based on above commit log, can we say that when existing GSO_ECN is not
> negotiated, ACCECN can work as_is without the patch_2?
> >
> > [1] commit 023af5a72ab16 ("gso: AccECN support")
>=20
> Indeed, this patch description implies that NIC that currently don't supp=
ort
> TCP_ECN will naturally support ACCECN.
> But an extra TSO_ACCECN flag will make this into an explicit requirement,=
 like
> our patch in the Linux.
>
If so, the 2nd patch should word saying, the device must not modify IP cong=
estion code point bits and TCP ACE bits.
All packets in the segment offload must have same bits.

Similarly on RX side for GRO, the device requirement to spell out that GRO =
stream to break when two subsequent packets have different bits etc.

If you can help to understand why RX side should set this and how one may p=
lan to use it, it makes sense to define the GUEST bit.
Presently it does not look useful for rx side (guest bit).
=20
> Related to another email about existing driver, one solution would be rep=
lace
> SKB_GSO_TCP_ECN with SKB_GSO_TCP_ACCECN, like in
> 4e4f7cefb130af6aba6a393b2d13930b49390df9.
> This can avoid CWR corruption somewhere after GRO, and we plan to submit
> related patches (old driver, virtio-related) into net-next after this is =
approved
> in virtio-spec.

Commit 4e4f7cefb130a looks incorrect to me, or I must be missing something.
It looks incorrect to me is because:
1. SKB_GSO_TCP_ACCECN is set when cwr is set, regardless of tcp socket foll=
owing rfc3168 or accecn.
I was hoping to set this flag only when its accecn.

2. Even though it is set, it is not read by anyone, so not sure why one wou=
ld set it.

3. It appears to me that it is TX side flag and rx GRO should not be settin=
g it, because there isn't rx side code to handle it yet.
May be this is part of some multi series work?

4. The commit 4e4f7cefb130a claims to prevent field corruption.
A corruption sounds like a bug. And if it is a bug, it the patch needs fixe=
s tag, but it does not have it.
Probably no fixes tag, because no users, that is strange kernel code to me.

