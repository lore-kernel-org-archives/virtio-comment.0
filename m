Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D35C5258
	for <virtio-comment@lists.linux.dev>; Thu, 26 Dec 2024 04:41:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735188076; cv=fail; b=kA2wZMOy6uSIoRNpAGJ77OlXSbqojyNysW5wSmztJLHeL5jcMcM+UNizLwyMo64KkgZsdhjt06wLpBY+hcwI4XPb3lTJfgnr0S52H8JG+A/lTLyw4t3/+TWL3+TX5PBDsfr5U+BtghMASksbWrjaUhuZ/OkV9JgpljlBVaJ9iGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735188076; c=relaxed/simple;
	bh=Qm/9oTcnHo2fwqthJAtFCdS6IXo0RlF4i4vWBCSOCx8=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=X0Tden4JnKYx5swWSEi4uLtuvz7d85lGOAmTQT1OF07UA1lq3EBfa5UxecwtytLMtAX+Bq4zPZrhCW1MPpELyG0czN3rv6y71m/ggNlkKCRCOHijY9qoEE7uV5UEnd1/ZmePO7unHS5H89TvP3GjQg8RSD5iT8GZm/IakwmcQ64=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=gOp6e+Dr; arc=fail smtp.client-ip=40.107.244.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="gOp6e+Dr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Iyirw72RqlJhq39DjtTXlOD5N3HqDlkJxS5g+QI6hZ+QFUCunjGWIv6Hm7nBqKAdEs5Gh6riD79h05BGqe3UVL/peHNsI5KBgeL2XhkYmsaqz2w5zP9+z2GIxqk7D2iThUbQ7sK/ig+wAlcFc6e8WU97clTBqLo85IIaiXiETstJ9mQ6jThmpYZb5O6IxX7kN6ZTT8LdEJfS2d04ZulU5V1bsANbNzAWzXXlOZcYUjkJGelUB17GkLdNqL3jZ4+vcD2ce3m97GHBfP817Dh2m8d2iID/E8Y9hB1Y94UneG1TO5GkiGO6dEpMJdYyUI4Az/w67LwjfsJgG+H8yt0Y0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uocHTWkZoTKzJQICrT7sSZZIsvfteZ8CRco8aSg54TI=;
 b=SnsRw7oEvP58psExFaB27sWO9IGJr7YgziisdL4XxtkR2EW4pYLbFRzx5ExyMNeNHE81ikm3O6Kx63YcrK3zBunnMkQgyp68tClzZWX6SDnTJUFP/K8mdV6GoQw2+GPrfNC/oypXUaDCzilhcJ/qHaBF4OmI7OZGLAwlemZVkeRxrqsq4/n8QrdhRvznpFy3V84JKP6B+Utt3BTOAnXjhJTTp7v3ZJl3uqvk6mb/l/TTiMRbYS0lMiYOusdTDrabpyxL3G4H/v11PrOIMPMOoS0cuTxtclsVRHEm4LmqJuA6JRdfnGFp2Znuxdb92+feIlb+3v7ovddgURgQH8+NRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uocHTWkZoTKzJQICrT7sSZZIsvfteZ8CRco8aSg54TI=;
 b=gOp6e+DrhiYzYNhXvv5kBLagAyh4VET6dEn/L19PHuKn0kciDW1kTYsjlRRadoxJCDFalCOviT2SP5jBHI6eAXduNtKLWQoi/lzzSFWmA4E0KyNFYPrV21eTMI/kXCVZDzYrd77FSyu7MtSXWNeWoAFYi70GriCwNpyPJQmqhAmlmQEK4JjFIXBwatuzjbMGthj4SmHcV6tfURg6trRFd+pjADI4fwld505YINQBwR9Tg/7CbU26Iyvd9hqocgO4BqLMxaYlCT/A8Xbu7moyys2xD5pdrskgQjlmX7pJFVg6HUmSbjwN7Kharw+wA3XbMJczQk/VHAzaTP7xBXmFDg==
Received: from CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11)
 by CY8PR12MB8266.namprd12.prod.outlook.com (2603:10b6:930:79::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.14; Thu, 26 Dec
 2024 04:41:06 +0000
Received: from CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd]) by CY8PR12MB7195.namprd12.prod.outlook.com
 ([fe80::c06c:905a:63f8:9cd%7]) with mapi id 15.20.8272.013; Thu, 26 Dec 2024
 04:41:06 +0000
From: Parav Pandit <parav@nvidia.com>
To: Akihiko Odaki <akihiko.odaki@daynix.com>, "virtio-comment@lists.linux.dev"
	<virtio-comment@lists.linux.dev>
CC: "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	"devel@daynix.com" <devel@daynix.com>
Subject: RE: [PATCH] virtio-net: Change num_buffers value
Thread-Topic: [PATCH] virtio-net: Change num_buffers value
Thread-Index:
 AQHbVpVXJB3eBmv4ZEexViKG9GakbbL2frMAgAABQgCAAVHo8IAAFAuAgAACvPCAAANVAIAAAUMAgAAERICAAAENwA==
Date: Thu, 26 Dec 2024 04:41:06 +0000
Message-ID:
 <CY8PR12MB7195D574A42D05E798E50D1CDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
References: <20241225-buffers-v1-1-712e839e8ad1@daynix.com>
 <CY8PR12MB7195705CAFA8759355685905DC0C2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <24facd94-87b2-45d1-97ca-851595e8cf41@daynix.com>
 <CY8PR12MB7195C2A20025389351D15B8DDC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <dcb6ad57-5d36-40f8-b161-7570dacdea4a@daynix.com>
 <CY8PR12MB7195C321CF982819C5393358DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <11feddcd-464a-4697-8462-32c165a7df49@daynix.com>
 <CY8PR12MB7195520E85F38BB409949868DC0D2@CY8PR12MB7195.namprd12.prod.outlook.com>
 <b037a580-0428-405a-ab2a-f02025fb8132@daynix.com>
In-Reply-To: <b037a580-0428-405a-ab2a-f02025fb8132@daynix.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR12MB7195:EE_|CY8PR12MB8266:EE_
x-ms-office365-filtering-correlation-id: 95ced0e3-1eb4-493b-f266-08dd256782f2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?jMA6JohBQIrRGHHtrPvhtZL0hyJZkLYQOjVdABRDzdwfZvx/+ZyB1xOfq+yG?=
 =?us-ascii?Q?sV+ypNyU3G+kFka/cI6kOm+9bzaZXQeqgXOd82qA80+SXQiif3+RAD/Velzq?=
 =?us-ascii?Q?peMCJx2B0sUK2VBmaGFONf52zk1Mknz4m2BBqQBoeRTudBBW1Hbr3oSuCa30?=
 =?us-ascii?Q?iK5ItV5LgCvdyOjXS1CfM0Dk5VYGrtTNKYo1W+fbPOnPC5znVy3wS7KLYbDe?=
 =?us-ascii?Q?ao4XxLwl33kHIyvSlENaDt95xEqAn0pa1eMmCsko7TUIIqYfviQiovesOq6h?=
 =?us-ascii?Q?SWVDOHwMP9eaVshV7Og9B3xuG+UKKYaWMwzDq0BD5byC/Xww84pwp3QVrLbd?=
 =?us-ascii?Q?0JDwKgIUK79z+JMTfz5FwoJXTnbRodXqkiCXB23/VZEEYdzo75m7rMZDfxlb?=
 =?us-ascii?Q?cLxQ4Fizn9RrhuM817Xa07odY7fdzlhBDQZeO2t02hBWzYWn8RJM62jvYaBd?=
 =?us-ascii?Q?LrYL/MttAtrl29b1wB+Z8zBXMAYdpaaxDO1boTz2/X6d3N28tvvmktNIiuBZ?=
 =?us-ascii?Q?1HKLiOVTM/7KaaapuLMQW1ve1Iya62XajSbl0rkaUYzxYrsKn/nVAJkalnZA?=
 =?us-ascii?Q?8wtarmdmLtpkadLIyIcwGw9ghelkOSd8yJ6H6i2Ym1EC4ojFjMWSOU8T2luN?=
 =?us-ascii?Q?ZHFLS0Zsz4DbZHRKmAeQFV3XKdx7d6Xm7IrS93LrSANFNq4EIG6qH0h6AT2p?=
 =?us-ascii?Q?/nKAgDDdPrc1KL07dQKzcditH9RyFCaVzdDjiN4MXr305h9U82dSU/WlMpzX?=
 =?us-ascii?Q?LKe5nwXEs+yGRKbw7q8TmV0TL2OdA9ScoirujYxNKudtdtpir1HPdEww+bQa?=
 =?us-ascii?Q?LhDK1tTDOEO2nVHtR0tw1wAeHYkHepOu05JCbQvVFBHPow4tJ5KZ1aNeQBAl?=
 =?us-ascii?Q?ie4oVi19EJljzGOTfjHrT1ZwgtJPARtO9vc9cmFjK1LPSbV3Zp6KmxgzLyCv?=
 =?us-ascii?Q?Fsu4W9C9NOhyaJ7OAX8iugEE6pM1Fsq35USenyh1My4/kMCQlUbErxpZrxi3?=
 =?us-ascii?Q?Mubq33vXKBfr+U7HYRU9HevCAFWQpL5p7T+oBrSCXG433uBlzTAyOmGgMFs+?=
 =?us-ascii?Q?TxuSEELdg+qzp+huqHqBzRkj+WM+vDVQS2kJmBmsFt/GJbSr5QBM6lxYoJkT?=
 =?us-ascii?Q?iL1Wmn0IbZFbsACTMvMkTHoplgIXQ0oRN3NQzDWfr+REKCuFs6lTxhcaiZ+u?=
 =?us-ascii?Q?5tS2ZODUcazn6CT1ceS+KQPr8mR8JDPDmFd1CeApYnv7+8nZqLUuxbVqSOid?=
 =?us-ascii?Q?StJxUWOd8r7uHmnCs1H5CbTsN3DrUEusfwiznLd7E9hZZBzdNyh73jULR24W?=
 =?us-ascii?Q?vQuqOpD2aEN5d0JlJLLwSbqvKyLHaoDnnj7bthtF9AEovzMZ6q/ae6j5Sjsi?=
 =?us-ascii?Q?4N13jqHkNfdjqEdHNTz+RMDJI0dnEzNIXw160KZonyrtrMvfXryRgBvHpDLY?=
 =?us-ascii?Q?8POu0dpgei2lZbJWBFUZF+Y2I8eYaezH?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR12MB7195.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?CDjHj4bvHvHbTl6Q6KM/80kWLBWX+f6UiOHhel5Jiwn+IyPErchy6qjKS4vX?=
 =?us-ascii?Q?wBDZj1OlIviqa7o82pMcTVTVyev/Xx/cY3pH9RMscs9rx8d3THMG4UqZQDAw?=
 =?us-ascii?Q?u0rkFXlok3RCU6LYSGPle0UyfPZ8wdyIT3/bsCkWTQ0G4PZ/L9r1Dl0jPU16?=
 =?us-ascii?Q?Bf33G2WL5mz3zerWOErmwimWl/TY35hYVroOiYqPW50HBRP26rfCRy6XQycs?=
 =?us-ascii?Q?GPe+5+6/ZKWbVA5uBQmWduRcY3Z834C5rA8Hqy+BQ6O3JGFStBy9PANwgOeO?=
 =?us-ascii?Q?ZoPvipM6S/DOBmJJih+1OZZov3Nie0SGILfXl9SDy1Qy9aelBA6U0GDHRD1h?=
 =?us-ascii?Q?/zPOxXHEmS3Ec+UaYkE6eTKtucrckvQ225m/AEv23w/MgsBEiN5rXX4Ch9Tg?=
 =?us-ascii?Q?d8oLfhxsjQGhlH7ntwdaFWksTlTQFEeiGbL8buBYBbu5+Z67lWoN62UvK7y2?=
 =?us-ascii?Q?kxtLBAD4kgx6H6EzMLKB1NuIEvoGdFlKcdDVJr+00pfEVqJZkgMGOlAy8G6u?=
 =?us-ascii?Q?kQLIssk3NoASG6Wg2aiwjz/G1krLD9kZ6aIB+Afy2imJ3h+y1NdOyAhPjmu1?=
 =?us-ascii?Q?zDPUE2eQe/RsVIYPLbXWPCVYxuGUz/WHbgZbM65OsUwGLv+u3D1RXIXr4Sho?=
 =?us-ascii?Q?CZ1Hmvndd+4TcqLq5j+NfTaJ5+A8oCQBCQwUhqzn41NPoTuPyvk1aiD0u//o?=
 =?us-ascii?Q?Mca/Ia95E3OdZf/aR07hqu+EPe6knE0dmrQEZCgV8t/MQtsdqUj4lhuZVW8n?=
 =?us-ascii?Q?w6CWA/bQ/vEn4rmWPHQhwWKMTCFMzgyQZBMLAF/lM2k2HodSgJOZ8XfqiQ9x?=
 =?us-ascii?Q?mshnlw0hAtyMlZZP+DoYbdUDd0PbqcyHlISAyCnBw6goyci0HLW8WYttM37q?=
 =?us-ascii?Q?SkuaI5W8j5YlnTtDOBNCyMtveSOxXp8uGemu6l7NivFW7ERd/WRuOKtCVcbg?=
 =?us-ascii?Q?GBqf0loTp2pdBXzylSDzj/nhBZZEr+alywqpXa75AGLt45oWm7PXyvPfA+W5?=
 =?us-ascii?Q?NvQKNrQFYh8c76lyJobtuflnc4u9TBrgliO9Pj97kWbZu7ZNtdw/B0hyZDrX?=
 =?us-ascii?Q?BzWykd7fFaFSAW/5IY+f5wC6zE1MbB/GXZTEvaljdlQCXyeRFAiAav11SR6r?=
 =?us-ascii?Q?ac/Ybolur5t6/57H9X3VpsfO9Z+4eo9cegvx59qQg+iXPllO3exMg5BRxPe2?=
 =?us-ascii?Q?MTYG3LQM9fCdNqpn5IXvzua0iQq3+DdVAKOuH1lODoq1C/cEzUaRfxJ2Ccte?=
 =?us-ascii?Q?36b9MB4me2NqJwITjNElkcRsq2DjXBAgX/esGLgw0Z9F3qtkcwnYkpM2TMlf?=
 =?us-ascii?Q?96ARTTJNf6Q1l86Mjtjl+yIGP473eRDQLFXmVtVaB2ncMRTPgIKAaTAXDS4/?=
 =?us-ascii?Q?FIqc2QMFYbTRFMRzTJDDA0nachAOimud4btt5T+AQGDPcbqR36VxNoqfgUme?=
 =?us-ascii?Q?fS8BBLl9S0C/1ZIv1prPsyz9b8PCdK0ygYfr4vPui9QjAkPtp88IxnsYT32J?=
 =?us-ascii?Q?HeJyLpGPbPyKsPsjlSXSnsMf38Mp+T3Jb45UMbLSTFacHAIzMrkfQgihZCua?=
 =?us-ascii?Q?g+6b054zPDokpWy/+EfAnHsvHhGk2kYtXzlpxsQN?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 95ced0e3-1eb4-493b-f266-08dd256782f2
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Dec 2024 04:41:06.5171
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XL1XAEot9QqGpPhEx6BqcGFH0RD1MKymv90Q2BbyXsIMLFhVnTKZsONMnTyyDbW4AFViGJaLINPDvhPfC5VYSg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8266



> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> Sent: Thursday, December 26, 2024 10:04 AM
>=20
> On 2024/12/26 13:24, Parav Pandit wrote:
> >
> >
> >> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >> Sent: Thursday, December 26, 2024 9:44 AM
> >>
> >> On 2024/12/26 13:08, Parav Pandit wrote:
> >>>
> >>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>> Sent: Thursday, December 26, 2024 9:22 AM
> >>>> To: Parav Pandit <parav@nvidia.com>; virtio-comment@lists.linux.dev
> >>>> Cc: Michael S. Tsirkin <mst@redhat.com>; Jason Wang
> >>>> <jasowang@redhat.com>; devel@daynix.com
> >>>> Subject: Re: [PATCH] virtio-net: Change num_buffers value
> >>>>
> >>>> On 2024/12/26 11:50, Parav Pandit wrote:
> >>>>>
> >>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>> Sent: Wednesday, December 25, 2024 12:01 PM
> >>>>>>
> >>>>>> On 2024/12/25 15:28, Parav Pandit wrote:
> >>>>>>>
> >>>>>>>> From: Akihiko Odaki <akihiko.odaki@daynix.com>
> >>>>>>>> Sent: Wednesday, December 25, 2024 11:52 AM
> >>>>>>>>
> >>>>>>>> Linux's vhost_net and QEMU sets num_buffers to zero when
> >>>>>>>> VIRTIO_NET_F_MRG_RXBUF is not negotiated. Change the
> >>>>>>>> specification to reflect this reality.
> >>>>>>>>
> >>>>>>> Please fix the vhost_net and QEMU to reflect the specification
> >>>>>>> which clearly
> >>>>>> writes num_buffers must be set to 1.
> >>>>>>> (the last hunk of this patch).
> >>>>>>> One cannot suddenly change what was written in the device spec
> >>>>>>> as
> >>>> 'must'
> >>>>>> requirement.
> >>>>>>>
> >>>>>>
> >>>>>> This proposal is based on the discussion happened during the
> >>>>>> vhost_net
> >>>>>> development:
> >>>>>>
> >>>>
> >>
> https://nam11.safelinks.protection.outlook.com/?url=3Dhttps%3A%2F%2Flor
> >>
> %2F&data=3D05%7C02%7Cparav%40nvidia.com%7C18c17324464546a9778c08
> dd25667
> >>
> a9d%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638707844275
> 828212%7
> >>
> CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> AwMCIsIl
> >>
> AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> a=3DL0J
> >> MY5SxX4C2q5UphZ%2BVLe07Cdmik9WJG7dWdvcLdb4%3D&reserved=3D0
> >>>>
> >>
> %2F&data=3D05%7C02%7Cparav%40nvidia.com%7C649e957573c04ca299a808
> >> dd2563b
> >>>>
> >>
> 763%7C43083d15727340c1b7db39efd9ccc17a%7C0%7C0%7C638707832422
> >> 610980%7
> >>>>
> >>
> CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMD
> >> AwMCIsIl
> >>>>
> >>
> AiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdat
> >> a=3Dbab
> >>>>
> >>
> vvZhhh8eCZAsF%2BMv4W0LjkD5KMTZn6OA4%2FzIMOAE%3D&reserved=3D0
> >>>>>>
> >>>>
> >>
> e.kernel.org%2Fall%2FCACGkMEt0spn59oLyoCwcJDdLeYUEibePF7gppxdVX1Y
> >>>> vmAr
> >>>>>>
> >>>>
> >>
> 72Q%40mail.gmail.com%2F&data=3D05%7C02%7Cparav%40nvidia.com%7C227
> >>>> ecfe28
> >>>>>>
> >>>>
> >>
> 0c04c7fbe0708dd2560ae73%7C43083d15727340c1b7db39efd9ccc17a%7C0%
> >>>> 7C0%7C
> >>>>>>
> >>>>
> >>
> 638707819369398017%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiO
> >>>> nRydWUsIl
> >>>>>>
> >>>>
> >>
> YiOiIwLjAuMDAwMCIsIlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D
> >>>> %7C
> >>>>>>
> >>>>
> >>
> 0%7C%7C%7C&sdata=3DJcJuXC0tHF%2BQwCjrpwDTnEWRrITD0hXwB3cTkwmZ
> >>>> qOk%3D&res
> >>>>>> erved=3D0
> >>>>>>
> >>>>>> The reasoning here is that vhost_net and QEMU set num_buffers to
> >>>>>> zero for years so changing it is more risky.
> >>>>> Less risky for the device or the driver?
> >>>>
> >>>> For the driver.
> >>>>
> >>>
> >>>>> Your response implies for the device, but do not understand how it
> >>>>> is less
> >>>> risky for the consumer of the field (driver).
> >>>>
> >>>> If there is a driver that reads the field, such a driver is likely
> >>>> to expect zero because the two most popular implementations sets
> >>>> the field
> >> to zero.
> >>>>
> >>> Why would driver expect zero there when spec said 1?
> >>> It can only work if the driver ignored the field.
> >>>
> >>>>> If the field was never read by all the drivers, it is better to
> >>>>> modify the spec
> >>>> to say following in the requirements section:
> >>>>> 1. device MAY set any value, or MAY NOT event set it.
> >>>>> 2. device SHOULD NOT set num_buffers.
> >>>>> 3. driver MUST ignore num_buffers when VIRTIO_NET_F_MRG_RXBUF
> is
> >>>> not negotiated.
> >>>>>
> >>>>> For the real PCI devices, this actually can save the sparse DMA
> >>>>> occurring on
> >>>> rx packet.
> >>>>> (telling 0 forces the device to do the DMA for the field that
> >>>>> driver
> >> ignores).
> >>>>>
> >>>>> Also please change the motivation in the commit log to indicates
> >>>>> that dpdk
> >>>> pmd, freebsd, windows, Linux, QNX drivers has never read/honored
> >>>> the field num_buffers when VIRTIO_NET_F_MRG_RXBUF is not
> negotiated.
> >>>>> Hence, make it optional for the device to set it.
> >>>>>
> >>>>> Please work with those open and closed source driver's maintainers
> >>>>> to get
> >>>> their ACK on non_usage by the driver.
> >>>>>
> >>>>> This change will help to save the PCI DMA.
> >>>>
> >>>> I don't think it will save the DMA because it is at middle of buffer=
.
> >>>>
> >>> Its part of the vnet hdr writing process. So its slightly lighter to
> >>> not write in
> >> simple cases.
> >>> How a device does DMA is upto the device on splitting the buffer.
> >>>
> >>> And if it does not save DMA, I don't see the motivation.
> >>> The driver is working with num_buffers=3D1 and num_buffers=3D0.
> >>> So what are we trying to save?
> >>> Aligning the spec to some behavior to one device implementation
> >>> makes
> >> other device implementations non compliant to the spec anyway.
> >>> So the risk part is not clear to me.
> >>
> >>
> >> I'm comparing the possibility that there is a driver that breaks with
> >> num_buffers=3D1 or one that breaks with num_buffers=3D0.
> >>
> >> When comparing these, it is more likely that there is a driver that
> >> breaks with num_buffers=3D1.
> > Why?
> > And if so, such driver should be fixed which didn't follow the spec for=
 10+
> years?
> >
> > What will you do if an automotive product driver has stringent check to=
 fail
> the pkt if num_buffers !=3D 1?
>=20
> Such a driver needs to be changed to ignore num_buffers if
> VIRTIO_NET_F_MRG_RXBUF is not negotiated.
>
But what if that driver is following spec version 1.2?
=20
> We can't make the device compatible with drivers that expects
> num_buffers=3D0=20
Can you please share an example of such driver?

> and ones that expects num_buffers=3D1 at the same time so
> we must determine either of them that is less risky.
>=20
> > Please get the ack of all.
>  > >> Most drivers should have been tested with vhost_net or
> >> QEMU
> > Please get the ack from the maintainers that driver has ignored the fie=
ld.
> > At that point this field to be marked as don't_care/ignored field inste=
ad of
> forcing 0 or 1.
> >
> >> so they should work with num_buffers=3D0, but they may not be tested
> >> and break with num_buffers=3D1.
> > This is hypothetical. Please get the enough data.
>=20
> We can't survey all the drivers that may exist in the world so we need to
> make the safest hypothesis.
>
In that case, let the spec be as_is. Let driver fix itself it was broken.
Change like this surely need survey from all the known drivers.
=20
> > We have PCI devices that do num_buffers=3D1 and tested with Linux, dpdk
> pmd, Windows drivers without issues on num_buffers.
>=20
> We are determining the safest option for drivers, which consume the value=
,
> not for devices. PCI devices with num_buffers=3D1 may be tested with the
> listed drivers, but may not be with others.
>=20
Then those drivers should be fixed.
For risk analysis, please get the maintainers ack and then making num_buffe=
rs as reserved field will be more natural that will match the drivers.
